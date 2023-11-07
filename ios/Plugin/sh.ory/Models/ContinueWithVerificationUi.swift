//
// ContinueWithVerificationUi.swift
//
// Generated by openapi-generator
// https://openapi-generator.tech
//

import Foundation
#if canImport(AnyCodable)
import AnyCodable
#endif

/** Indicates, that the UI flow could be continued by showing a verification ui */
public struct ContinueWithVerificationUi: Codable, JSONEncodable, Hashable {

    public enum Action: String, Codable, CaseIterable {
        case showVerificationUi = "show_verification_ui"
    }
    /** Action will always be `show_verification_ui` show_verification_ui ContinueWithActionShowVerificationUIString */
    public var action: Action
    public var flow: ContinueWithVerificationUiFlow

    public init(action: Action, flow: ContinueWithVerificationUiFlow) {
        self.action = action
        self.flow = flow
    }

    public enum CodingKeys: String, CodingKey, CaseIterable {
        case action
        case flow
    }

    // Encodable protocol methods

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(action, forKey: .action)
        try container.encode(flow, forKey: .flow)
    }
}
