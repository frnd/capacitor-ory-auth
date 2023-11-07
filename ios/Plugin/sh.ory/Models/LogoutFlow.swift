//
// LogoutFlow.swift
//
// Generated by openapi-generator
// https://openapi-generator.tech
//

import Foundation
#if canImport(AnyCodable)
import AnyCodable
#endif

/** Logout Flow */
public struct LogoutFlow: Codable, JSONEncodable, Hashable {

    /** LogoutToken can be used to perform logout using AJAX. */
    public var logoutToken: String
    /** LogoutURL can be opened in a browser to sign the user out.  format: uri */
    public var logoutUrl: String

    public init(logoutToken: String, logoutUrl: String) {
        self.logoutToken = logoutToken
        self.logoutUrl = logoutUrl
    }

    public enum CodingKeys: String, CodingKey, CaseIterable {
        case logoutToken = "logout_token"
        case logoutUrl = "logout_url"
    }

    // Encodable protocol methods

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(logoutToken, forKey: .logoutToken)
        try container.encode(logoutUrl, forKey: .logoutUrl)
    }
}

