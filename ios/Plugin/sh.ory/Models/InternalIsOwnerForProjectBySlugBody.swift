//
// InternalIsOwnerForProjectBySlugBody.swift
//
// Generated by openapi-generator
// https://openapi-generator.tech
//

import Foundation
#if canImport(AnyCodable)
import AnyCodable
#endif

/** Is Owner For Project By Slug Request Body */
public struct InternalIsOwnerForProjectBySlugBody: Codable, JSONEncodable, Hashable {

    public enum Namespace: String, Codable, CaseIterable {
        case user = "User"
        case apikey = " ApiKey"
    }
    /** Namespace is the namespace of the subject. */
    public var namespace: Namespace
    /** ProjectScope is the project_id resolved from the API Token. */
    public var projectScope: String?
    /** ProjectSlug is the project's slug. */
    public var projectSlug: String
    /** Subject is the subject acting (user or API key). */
    public var subject: String

    public init(namespace: Namespace, projectScope: String? = nil, projectSlug: String, subject: String) {
        self.namespace = namespace
        self.projectScope = projectScope
        self.projectSlug = projectSlug
        self.subject = subject
    }

    public enum CodingKeys: String, CodingKey, CaseIterable {
        case namespace
        case projectScope = "project_scope"
        case projectSlug = "project_slug"
        case subject
    }

    // Encodable protocol methods

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(namespace, forKey: .namespace)
        try container.encodeIfPresent(projectScope, forKey: .projectScope)
        try container.encode(projectSlug, forKey: .projectSlug)
        try container.encode(subject, forKey: .subject)
    }
}

