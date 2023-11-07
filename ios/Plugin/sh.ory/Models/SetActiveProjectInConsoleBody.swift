//
// SetActiveProjectInConsoleBody.swift
//
// Generated by openapi-generator
// https://openapi-generator.tech
//

import Foundation
#if canImport(AnyCodable)
import AnyCodable
#endif

/** Set active project in the Ory Network Console Request Body */
public struct SetActiveProjectInConsoleBody: Codable, JSONEncodable, Hashable {

    /** Project ID  The Project ID you want to set active.  format: uuid */
    public var projectId: String

    public init(projectId: String) {
        self.projectId = projectId
    }

    public enum CodingKeys: String, CodingKey, CaseIterable {
        case projectId = "project_id"
    }

    // Encodable protocol methods

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(projectId, forKey: .projectId)
    }
}

