//
// OrganizationBody.swift
//
// Generated by openapi-generator
// https://openapi-generator.tech
//

import Foundation
#if canImport(AnyCodable)
import AnyCodable
#endif

/** Create B2B SSO Organization Request Body */
public struct OrganizationBody: Codable, JSONEncodable, Hashable {

    /** Domains contains the list of organization's domains. */
    public var domains: [String]?
    /** Label contains the organization's label. */
    public var label: String?

    public init(domains: [String]? = nil, label: String? = nil) {
        self.domains = domains
        self.label = label
    }

    public enum CodingKeys: String, CodingKey, CaseIterable {
        case domains
        case label
    }

    // Encodable protocol methods

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(domains, forKey: .domains)
        try container.encodeIfPresent(label, forKey: .label)
    }
}

