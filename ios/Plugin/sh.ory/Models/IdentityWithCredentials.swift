//
// IdentityWithCredentials.swift
//
// Generated by openapi-generator
// https://openapi-generator.tech
//

import Foundation
#if canImport(AnyCodable)
import AnyCodable
#endif

/** Create Identity and Import Credentials */
public struct IdentityWithCredentials: Codable, JSONEncodable, Hashable {

    public var oidc: IdentityWithCredentialsOidc?
    public var password: IdentityWithCredentialsPassword?

    public init(oidc: IdentityWithCredentialsOidc? = nil, password: IdentityWithCredentialsPassword? = nil) {
        self.oidc = oidc
        self.password = password
    }

    public enum CodingKeys: String, CodingKey, CaseIterable {
        case oidc
        case password
    }

    // Encodable protocol methods

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(oidc, forKey: .oidc)
        try container.encodeIfPresent(password, forKey: .password)
    }
}
