//
// ManagedIdentitySchemaValidationResult.swift
//
// Generated by openapi-generator
// https://openapi-generator.tech
//

import Foundation
#if canImport(AnyCodable)
import AnyCodable
#endif

/** Ory Identity Schema Validation Result */
public struct ManagedIdentitySchemaValidationResult: Codable, JSONEncodable, Hashable {

    public var message: String?
    public var valid: Bool?

    public init(message: String? = nil, valid: Bool? = nil) {
        self.message = message
        self.valid = valid
    }

    public enum CodingKeys: String, CodingKey, CaseIterable {
        case message
        case valid
    }

    // Encodable protocol methods

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(message, forKey: .message)
        try container.encodeIfPresent(valid, forKey: .valid)
    }
}
