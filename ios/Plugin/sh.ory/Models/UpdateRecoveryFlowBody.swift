//
// UpdateRecoveryFlowBody.swift
//
// Generated by openapi-generator
// https://openapi-generator.tech
//

import Foundation
#if canImport(AnyCodable)
import AnyCodable
#endif

/** Update Recovery Flow Request Body */
public enum UpdateRecoveryFlowBody: Codable, JSONEncodable, Hashable {
    case typeUpdateRecoveryFlowWithCodeMethod(UpdateRecoveryFlowWithCodeMethod)
    case typeUpdateRecoveryFlowWithLinkMethod(UpdateRecoveryFlowWithLinkMethod)

    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        switch self {
        case .typeUpdateRecoveryFlowWithCodeMethod(let value):
            try container.encode(value)
        case .typeUpdateRecoveryFlowWithLinkMethod(let value):
            try container.encode(value)
        }
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if let value = try? container.decode(UpdateRecoveryFlowWithCodeMethod.self) {
            self = .typeUpdateRecoveryFlowWithCodeMethod(value)
        } else if let value = try? container.decode(UpdateRecoveryFlowWithLinkMethod.self) {
            self = .typeUpdateRecoveryFlowWithLinkMethod(value)
        } else {
            throw DecodingError.typeMismatch(Self.Type.self, .init(codingPath: decoder.codingPath, debugDescription: "Unable to decode instance of UpdateRecoveryFlowBody"))
        }
    }
}

