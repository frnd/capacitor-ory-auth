//
// InternalIsAXWelcomeScreenEnabledForProjectBody.swift
//
// Generated by openapi-generator
// https://openapi-generator.tech
//

import Foundation
#if canImport(AnyCodable)
import AnyCodable
#endif

/** Is Account Experience Enabled For Project Request Body */
public struct InternalIsAXWelcomeScreenEnabledForProjectBody: Codable, JSONEncodable, Hashable {

    /** Path is the path of the request. */
    public var path: String
    /** ProjectSlug is the project's slug. */
    public var projectSlug: String

    public init(path: String, projectSlug: String) {
        self.path = path
        self.projectSlug = projectSlug
    }

    public enum CodingKeys: String, CodingKey, CaseIterable {
        case path
        case projectSlug = "project_slug"
    }

    // Encodable protocol methods

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(path, forKey: .path)
        try container.encode(projectSlug, forKey: .projectSlug)
    }
}
