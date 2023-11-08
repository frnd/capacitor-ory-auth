//
// ProjectCors.swift
//
// Generated by openapi-generator
// https://openapi-generator.tech
//

import Foundation
#if canImport(AnyCodable)
import AnyCodable
#endif

public struct ProjectCors: Codable, JSONEncodable, Hashable {

    /** Whether CORS is enabled for this endpoint. */
    public var enabled: Bool
    /** The allowed origins. Use `*` to allow all origins. A wildcard can also be used in the subdomain, i.e. `https://_*.example.com` will allow all origins on all subdomains of `example.com`. */
    public var origins: [String]

    public init(enabled: Bool, origins: [String]) {
        self.enabled = enabled
        self.origins = origins
    }

    public enum CodingKeys: String, CodingKey, CaseIterable {
        case enabled
        case origins
    }

    // Encodable protocol methods

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(enabled, forKey: .enabled)
        try container.encode(origins, forKey: .origins)
    }
}
