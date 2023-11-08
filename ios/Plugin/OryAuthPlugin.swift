import Foundation
import Capacitor


/**
 * Please read the Capacitor iOS Plugin Development Guide
 * here: https://capacitorjs.com/docs/plugins/ios
 */
@objc(OryAuthPlugin)
public class OryAuthPlugin: CAPPlugin {

    private var auth: OryAuth? = nil

    @objc func initialize(_ call: CAPPluginCall) {
        let basePath = call.getString("basePath") ?? ""
        OpenAPIClientAPI.basePath = basePath
        auth = OryAuth()
        call.resolve()
    }
    
    @objc func session(_ call: CAPPluginCall) {
        
        guard auth == nil else {
            call.reject("Can not get session. Initialize plugin before use.");
            return
        }
        
        auth!.session(completion: { active, error in
            call.resolve([
                "active": active
            ])
        })
    }
    
    @objc func signIn(_ call: CAPPluginCall) {
        
        guard auth != nil else {
            call.reject("Can not sign in. Initialize plugin before use.");
            return
        }
        
        do {
            let password = call.getString("password")
            let traits = call.getObject("traits")
            
            guard password != nil && traits != nil && traits?.index(forKey: "email") != nil else {
                call.reject("Specify a password and traits.email")
                return
            }
        
            let theJSONData = try JSONSerialization.data(withJSONObject: traits as Any, options: [])
            let jsonTraits = String(data: theJSONData, encoding: .utf8)!
        
            auth!.signin(password: password!, traits: jsonTraits) { active, error in
                guard error == nil else {
                    call.reject(error!.localizedDescription)
                    return
                }
                call.resolve([
                    "active": active ?? false
                ])
            }
        
        } catch {
            call.reject(error.localizedDescription)
        }

    }
    @objc func verify(_ call: CAPPluginCall) {
        
        guard auth != nil else {
            call.reject("Can not verify. Initialize plugin before use.");
            return
        }
        
        let id = call.getString("id");
        let code = call.getString("code");
        let email = call.getString("email");
        
        guard id == nil && code == nil else {
            call.reject("Specify a id and code")
            return
        }
        
        auth!.verify(id: id!, code: code!, email: email, completion: { state, error in
            guard error == nil else {
                call.reject(error!.localizedDescription)
                return
            }
            call.resolve(["state": state])
        })
    }
    
    @objc func logIn(_ call: CAPPluginCall) {
        
        guard auth != nil else {
            call.reject("Can not log in. Initialize plugin before use.");
            return
        }
    
        let identifier = call.getString("identifier") ?? ""
        let password = call.getString("password") ?? ""
        auth!.login(identifier: identifier, password: password, completion: { error in
            guard error == nil else {
                call.reject(error!.localizedDescription)
                return
            }
            call.resolve()
        })
    }
    
    @objc func logOut(_ call: CAPPluginCall) {
        
        guard auth != nil else {
            call.reject("Can not log out. Initialize plugin before use.");
            return
        }
        
        auth!.logout(completion: { error in
            guard error == nil else {
                call.reject(error!.localizedDescription)
                return
            }
            call.resolve()
        })
    }
}
