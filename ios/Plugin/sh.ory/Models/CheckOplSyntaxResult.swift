//
// CheckOplSyntaxResult.swift
//
// Generated by openapi-generator
// https://openapi-generator.tech
//

import Foundation
#if canImport(AnyCodable)
import AnyCodable
#endif

public struct CheckOplSyntaxResult: Codable, JSONEncodable, Hashable {

    /** The list of syntax errors */
    public var errors: [ParseError]?

    public init(errors: [ParseError]? = nil) {
        self.errors = errors
    }

    public enum CodingKeys: String, CodingKey, CaseIterable {
        case errors
    }

    // Encodable protocol methods

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(errors, forKey: .errors)
    }
}
