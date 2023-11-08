//
//  SessionTokenStore.swift
//  FrndCapacitorOryAuth
//
//  Created by Fernando González on 21/11/23.
//

import Foundation
import SwiftKeychainWrapper

// TODO create as object instead og static class.
public class SessionTokenStore {
    
    static let SESSION_TOKEN_NAME = "xSessionToken"

    public static func get() -> String?{
        return KeychainWrapper.standard.string(forKey: SESSION_TOKEN_NAME)
    }
    
    public static func set(sessionToken: String) -> Bool {
        let saveSuccessful: Bool = KeychainWrapper.standard.set(sessionToken, forKey: SESSION_TOKEN_NAME)
        return saveSuccessful
    }
    
    public static func clear() {
        KeychainWrapper.standard.remove(forKey: "xSessionToken")
    }

}
