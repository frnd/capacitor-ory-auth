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
        print("initialize")
        let basePath = call.getString("basePath") ?? ""
        OpenAPIClientAPI.basePath = basePath
        auth = OryAuth()
        call.resolve()
    }
    @objc func session(_ call: CAPPluginCall) {
        
        if(auth == nil) {
            call.reject("Initialize plugin before use.");
        } else {
            call.resolve([
                "active": auth?.session() ?? false
            ])
        }
        
        
    }
    @objc func signIn(_ call: CAPPluginCall) {
        
        if(auth == nil) {
            call.reject("Initialize plugin before use.");
        }
        
        print("signIn")
        call.resolve()
    }
    @objc func verify(_ call: CAPPluginCall) {
        
        if(auth == nil) {
            call.reject("Initialize plugin before use.");
        }
        
        print("verify")
        call.resolve()
    }
    @objc func logIn(_ call: CAPPluginCall) {
        
        if(auth == nil) {
            call.reject("Initialize plugin before use.");
        }
        
        print("logIn")
        call.resolve()
    }
    @objc func logOut(_ call: CAPPluginCall) {
        
        if(auth == nil) {
            call.reject("Initialize plugin before use.");
        }
        
        print("logOut")
        call.resolve()
    }

}
