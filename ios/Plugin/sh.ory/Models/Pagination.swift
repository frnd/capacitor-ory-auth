//
// Pagination.swift
//
// Generated by openapi-generator
// https://openapi-generator.tech
//

import Foundation
#if canImport(AnyCodable)
import AnyCodable
#endif

public struct Pagination: Codable, JSONEncodable, Hashable {

    static let pageSizeRule = NumericRule<Int64>(minimum: 1, exclusiveMinimum: false, maximum: 1000, exclusiveMaximum: false, multipleOf: nil)
    static let pageTokenRule = StringRule(minLength: nil, maxLength: nil, pattern: nil)
    /** Items per page  This is the number of items per page to return. For details on pagination please head over to the [pagination documentation](https://www.ory.sh/docs/ecosystem/api-design#pagination). */
    public var pageSize: Int64? = 250
    /** Next Page Token  The next page token. For details on pagination please head over to the [pagination documentation](https://www.ory.sh/docs/ecosystem/api-design#pagination). */
    public var pageToken: String? = "1"

    public init(pageSize: Int64? = 250, pageToken: String? = "1") {
        self.pageSize = pageSize
        self.pageToken = pageToken
    }

    public enum CodingKeys: String, CodingKey, CaseIterable {
        case pageSize = "page_size"
        case pageToken = "page_token"
    }

    // Encodable protocol methods

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(pageSize, forKey: .pageSize)
        try container.encodeIfPresent(pageToken, forKey: .pageToken)
    }
}

