//
// ConsistencyRequestParameters.swift
//
// Generated by openapi-generator
// https://openapi-generator.tech
//

import Foundation
#if canImport(AnyCodable)
import AnyCodable
#endif

/** Control API consistency guarantees */
public struct ConsistencyRequestParameters: Codable, JSONEncodable, Hashable {

    public enum Consistency: String, Codable, CaseIterable {
        case empty = ""
        case strong = "strong"
        case eventual = "eventual"
    }
    /** Read Consistency Level (preview)  The read consistency level determines the consistency guarantee for reads:  strong (slow): The read is guaranteed to return the most recent data committed at the start of the read. eventual (very fast): The result will return data that is about 4.8 seconds old.  The default consistency guarantee can be changed in the Ory Network Console or using the Ory CLI with `ory patch project --replace '/previews/default_read_consistency_level=\"strong\"'`.  Setting the default consistency level to `eventual` may cause regressions in the future as we add consistency controls to more APIs. Currently, the following APIs will be affected by this setting:  `GET /admin/identities`  This feature is in preview and only available in Ory Network.  ConsistencyLevelUnset  ConsistencyLevelUnset is the unset / default consistency level. strong ConsistencyLevelStrong  ConsistencyLevelStrong is the strong consistency level. eventual ConsistencyLevelEventual  ConsistencyLevelEventual is the eventual consistency level using follower read timestamps. */
    public var consistency: Consistency?

    public init(consistency: Consistency? = nil) {
        self.consistency = consistency
    }

    public enum CodingKeys: String, CodingKey, CaseIterable {
        case consistency
    }

    // Encodable protocol methods

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(consistency, forKey: .consistency)
    }
}

