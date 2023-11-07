//
// VerifiableCredentialResponse.swift
//
// Generated by openapi-generator
// https://openapi-generator.tech
//

import Foundation
#if canImport(AnyCodable)
import AnyCodable
#endif

public struct VerifiableCredentialResponse: Codable, JSONEncodable, Hashable {

    public var credentialDraft00: String?
    public var format: String?

    public init(credentialDraft00: String? = nil, format: String? = nil) {
        self.credentialDraft00 = credentialDraft00
        self.format = format
    }

    public enum CodingKeys: String, CodingKey, CaseIterable {
        case credentialDraft00 = "credential_draft_00"
        case format
    }

    // Encodable protocol methods

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(credentialDraft00, forKey: .credentialDraft00)
        try container.encodeIfPresent(format, forKey: .format)
    }
}

