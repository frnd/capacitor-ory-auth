//
// ExpandedPermissionTree.swift
//
// Generated by openapi-generator
// https://openapi-generator.tech
//

import Foundation
#if canImport(AnyCodable)
import AnyCodable
#endif

public struct ExpandedPermissionTree: Codable, JSONEncodable, Hashable {

    public enum ModelType: String, Codable, CaseIterable {
        case union = "union"
        case exclusion = "exclusion"
        case intersection = "intersection"
        case leaf = "leaf"
        case tupleToSubjectSet = "tuple_to_subject_set"
        case computedSubjectSet = "computed_subject_set"
        case not = "not"
        case unspecified = "unspecified"
    }
    /** The children of the node, possibly none. */
    public var children: [ExpandedPermissionTree]?
    public var tuple: Relationship?
    /** The type of the node. union TreeNodeUnion exclusion TreeNodeExclusion intersection TreeNodeIntersection leaf TreeNodeLeaf tuple_to_subject_set TreeNodeTupleToSubjectSet computed_subject_set TreeNodeComputedSubjectSet not TreeNodeNot unspecified TreeNodeUnspecified */
    public var type: ModelType

    public init(children: [ExpandedPermissionTree]? = nil, tuple: Relationship? = nil, type: ModelType) {
        self.children = children
        self.tuple = tuple
        self.type = type
    }

    public enum CodingKeys: String, CodingKey, CaseIterable {
        case children
        case tuple
        case type
    }

    // Encodable protocol methods

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(children, forKey: .children)
        try container.encodeIfPresent(tuple, forKey: .tuple)
        try container.encode(type, forKey: .type)
    }
}

