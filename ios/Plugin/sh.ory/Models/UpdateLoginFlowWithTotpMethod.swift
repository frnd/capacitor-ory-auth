//
// UpdateLoginFlowWithTotpMethod.swift
//
// Generated by openapi-generator
// https://openapi-generator.tech
//

import Foundation
#if canImport(AnyCodable)
import AnyCodable
#endif

/** Update Login Flow with TOTP Method */
public struct UpdateLoginFlowWithTotpMethod: Codable, JSONEncodable, Hashable {

    /** Sending the anti-csrf token is only required for browser login flows. */
    public var csrfToken: String?
    /** Method should be set to \"totp\" when logging in using the TOTP strategy. */
    public var method: String
    /** The TOTP code. */
    public var totpCode: String

    public init(csrfToken: String? = nil, method: String, totpCode: String) {
        self.csrfToken = csrfToken
        self.method = method
        self.totpCode = totpCode
    }

    public enum CodingKeys: String, CodingKey, CaseIterable {
        case csrfToken = "csrf_token"
        case method
        case totpCode = "totp_code"
    }

    // Encodable protocol methods

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(csrfToken, forKey: .csrfToken)
        try container.encode(method, forKey: .method)
        try container.encode(totpCode, forKey: .totpCode)
    }
}

