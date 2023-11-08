//
// SourcePosition.swift
//
// Generated by openapi-generator
// https://openapi-generator.tech
//

import Foundation
#if canImport(AnyCodable)
import AnyCodable
#endif

public struct SourcePosition: Codable, JSONEncodable, Hashable {

    public var line: Int64?
    public var column: Int64?

    public init(line: Int64? = nil, column: Int64? = nil) {
        self.line = line
        self.column = column
    }

    public enum CodingKeys: String, CodingKey, CaseIterable {
        case line = "Line"
        case column
    }

    // Encodable protocol methods

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(line, forKey: .line)
        try container.encodeIfPresent(column, forKey: .column)
    }
}
