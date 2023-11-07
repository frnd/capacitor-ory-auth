//
// Usage.swift
//
// Generated by openapi-generator
// https://openapi-generator.tech
//

import Foundation
#if canImport(AnyCodable)
import AnyCodable
#endif

public struct Usage: Codable, JSONEncodable, Hashable {

    public var genericUsage: GenericUsage?

    public init(genericUsage: GenericUsage? = nil) {
        self.genericUsage = genericUsage
    }

    public enum CodingKeys: String, CodingKey, CaseIterable {
        case genericUsage = "GenericUsage"
    }

    // Encodable protocol methods

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(genericUsage, forKey: .genericUsage)
    }
}
