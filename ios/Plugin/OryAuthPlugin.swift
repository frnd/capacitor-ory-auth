import Foundation
import Capacitor

/**
 * Please read the Capacitor iOS Plugin Development Guide
 * here: https://capacitorjs.com/docs/plugins/ios
 */
@objc(OryAuthPlugin)
public class OryAuthPlugin: CAPPlugin {
    private let implementation = OryAuth()

    @objc func echo(_ call: CAPPluginCall) {
        let value = call.getString("value") ?? ""
        call.resolve([
            "value": implementation.echo(value)
        ])
    }

    @objc func initialize(_ call: CAPPluginCall) {
        print("initializeeee")
        call.resolve()
    }
    @objc func session(_ call: CAPPluginCall) {
        print("session")
        call.resolve()
    }
    @objc func signIn(_ call: CAPPluginCall) {
        print("signIn")
        call.resolve()
    }
    @objc func verify(_ call: CAPPluginCall) {
        print("verify")
        call.resolve()
    }
    @objc func logIn(_ call: CAPPluginCall) {
        print("logIn")
        call.resolve()
    }
    @objc func logOut(_ call: CAPPluginCall) {
        print("logOut")
        call.resolve()
    }

}
