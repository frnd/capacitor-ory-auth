//
// SuccessfulProjectUpdate.swift
//
// Generated by openapi-generator
// https://openapi-generator.tech
//

import Foundation
#if canImport(AnyCodable)
import AnyCodable
#endif

public struct SuccessfulProjectUpdate: Codable, JSONEncodable, Hashable {

    public var project: Project
    /** Import Warnings  Not all configuration items can be imported to the Ory Network. For example, setting the port does not make sense because the Ory Network provides the runtime and networking.  This field contains warnings where configuration keys were found but can not be imported. These keys will be ignored by the Ory Network. This field will help you understand why certain configuration keys might not be respected! */
    public var warnings: [Warning]

    public init(project: Project, warnings: [Warning]) {
        self.project = project
        self.warnings = warnings
    }

    public enum CodingKeys: String, CodingKey, CaseIterable {
        case project
        case warnings
    }

    // Encodable protocol methods

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(project, forKey: .project)
        try container.encode(warnings, forKey: .warnings)
    }
}

