//
// PatchIdentitiesBody.swift
//
// Generated by openapi-generator
// https://openapi-generator.tech
//

import Foundation
#if canImport(AnyCodable)
import AnyCodable
#endif

/** Patch Identities Body */
public struct PatchIdentitiesBody: Codable, JSONEncodable, Hashable {

    /** Identities holds the list of patches to apply  required */
    public var identities: [IdentityPatch]?

    public init(identities: [IdentityPatch]? = nil) {
        self.identities = identities
    }

    public enum CodingKeys: String, CodingKey, CaseIterable {
        case identities
    }

    // Encodable protocol methods

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(identities, forKey: .identities)
    }
}

