import Foundation

@objc public class OryAuth: NSObject {
    @objc public func session() -> Bool {
        return false
    }
    
    @objc public func login(identifier: String, password: String) -> String {
        return ""
    }
    
    @objc public func logout() -> String {
        return ""
    }
    
    @objc public func signin(identifier: String, traits: String) -> String {
        return ""
    }
    
    @objc public func verify(id: String, code: String, email: String) -> String {
        return ""
    }
    
}
