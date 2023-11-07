//
// SubjectSet.swift
//
// Generated by openapi-generator
// https://openapi-generator.tech
//

import Foundation
#if canImport(AnyCodable)
import AnyCodable
#endif

public struct SubjectSet: Codable, JSONEncodable, Hashable {

    /** Namespace of the Subject Set */
    public var namespace: String
    /** Object of the Subject Set */
    public var object: String
    /** Relation of the Subject Set */
    public var relation: String

    public init(namespace: String, object: String, relation: String) {
        self.namespace = namespace
        self.object = object
        self.relation = relation
    }

    public enum CodingKeys: String, CodingKey, CaseIterable {
        case namespace
        case object
        case relation
    }

    // Encodable protocol methods

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(namespace, forKey: .namespace)
        try container.encode(object, forKey: .object)
        try container.encode(relation, forKey: .relation)
    }
}

