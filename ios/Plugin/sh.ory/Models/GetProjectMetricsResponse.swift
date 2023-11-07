//
// GetProjectMetricsResponse.swift
//
// Generated by openapi-generator
// https://openapi-generator.tech
//

import Foundation
#if canImport(AnyCodable)
import AnyCodable
#endif

/** Response of the getMetrics endpoint */
public struct GetProjectMetricsResponse: Codable, JSONEncodable, Hashable {

    /** The list of data points. */
    public var data: [MetricsDatapoint]

    public init(data: [MetricsDatapoint]) {
        self.data = data
    }

    public enum CodingKeys: String, CodingKey, CaseIterable {
        case data
    }

    // Encodable protocol methods

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(data, forKey: .data)
    }
}
