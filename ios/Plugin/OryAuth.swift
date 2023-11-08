import Foundation
import AnyCodable
import SwiftKeychainWrapper


@objc public class OryAuth: NSObject {
    
    let VERIFIED = "VERIFIED" // TODO
    
    @objc public func session(completion: @escaping (_ active: Bool, _ error: Error?) -> Void) -> Void {

        let xSessionToken: String? = SessionTokenStore.get()

        ClientFrontendAPI.toSession(xSessionToken: xSessionToken) { (session, error) in
            guard error == nil else {
                completion(false, error)
                return
            }

            completion(session?.active ?? false, nil)
        }
    }

    @objc public func login(identifier: String, password: String, completion: @escaping (_ error: Error?) -> Void) -> Void {
        
        ClientFrontendAPI.createNativeLoginFlow( returnSessionTokenExchangeCode: true) { (flow, error) in
            guard error == nil else {
                completion(error)
                return
            }
            
            let psswd = UpdateLoginFlowWithPasswordMethod(
                identifier: identifier, method: "password", password: password)
            let body = UpdateLoginFlowBody.typeUpdateLoginFlowWithPasswordMethod(psswd)

            ClientFrontendAPI.updateLoginFlow(flow: flow!.id, updateLoginFlowBody: body) { (login, error) in
                guard error == nil else {
                    completion(error)
                    return
                }
                let saveSuccessful = SessionTokenStore.set(sessionToken: login!.sessionToken!)
                guard saveSuccessful == true else {
                    completion(error) // TODO create new error
                    return
                }
                completion(nil)
            }
        }
        
        return
    }

    @objc public func logout(completion: @escaping (_ error: Error?) -> Void) -> Void {
        let xSessionToken: String? = SessionTokenStore.get()
        let body = PerformNativeLogoutBody.init(sessionToken: xSessionToken!)
        ClientFrontendAPI.performNativeLogout(performNativeLogoutBody: body) { data, error in
            guard error == nil else {
                completion(error)
                return
            }
            
            SessionTokenStore.clear()
            completion(nil)
        }
        return
    }

    @objc public func signin(password: String, traits: String ,completion: @escaping (_ id: String?, _ error: Error?) -> Void) -> Void {
        
        ClientFrontendAPI.createNativeRegistrationFlow(returnSessionTokenExchangeCode: true) { flow, error in
            guard error == nil else {
                completion(nil, error)
                return
            }
            
            let psswd = UpdateRegistrationFlowWithPasswordMethod(
                method: "password", password: password, traits: AnyCodable.init(stringLiteral: traits))
            let body = UpdateRegistrationFlowBody.typeUpdateRegistrationFlowWithPasswordMethod(psswd)
            
            ClientFrontendAPI.updateRegistrationFlow(flow: flow!.id, updateRegistrationFlowBody: body) { registration, error in
                guard error == nil else {
                    completion(nil, error)
                    return
                }
                let saveSuccessful: Bool = SessionTokenStore.set(sessionToken: registration!.sessionToken!)
                guard saveSuccessful == true else {
                    completion(nil, error) // TODO create new error
                    return
                }
                registration?.continueWith?.forEach({ item in
                    switch item {
                    case .typeContinueWithVerificationUi(let value):
                        completion(value.flow.id, nil)
                        return
                    case .typeContinueWithSetOrySessionToken(_):
                        break
                    }
                })
                return completion(nil, nil)
            }
            
        }
        
    }

    @objc public func verify(id: String, code: String, email: String?, completion: @escaping (_ active: Bool, _ error: Error?) -> Void) -> Void {
        
        ClientFrontendAPI.getVerificationFlow(id: id) { flow, error in
            guard error == nil else {
                completion(false, error)
                return
            }
            
            let body = UpdateVerificationFlowBody.typeUpdateVerificationFlowWithCodeMethod(UpdateVerificationFlowWithCodeMethod(code: code, email: email, method: UpdateVerificationFlowWithCodeMethod.Method.link))
            
            ClientFrontendAPI.updateVerificationFlow(flow: flow!.id, updateVerificationFlowBody: body) { verification, error in
                guard error == nil else {
                    completion(false, error)
                    return
                }
                
                completion(verification?.state?.description == self.VERIFIED, nil)
                
            }
        }
    }

}
