//
// UpdateLoginFlowBody.swift
//
// Generated by openapi-generator
// https://openapi-generator.tech
//

import Foundation
#if canImport(AnyCodable)
import AnyCodable
#endif

public enum UpdateLoginFlowBody: Codable, JSONEncodable, Hashable {
    case typeUpdateLoginFlowWithCodeMethod(UpdateLoginFlowWithCodeMethod)
    case typeUpdateLoginFlowWithLookupSecretMethod(UpdateLoginFlowWithLookupSecretMethod)
    case typeUpdateLoginFlowWithOidcMethod(UpdateLoginFlowWithOidcMethod)
    case typeUpdateLoginFlowWithPasswordMethod(UpdateLoginFlowWithPasswordMethod)
    case typeUpdateLoginFlowWithTotpMethod(UpdateLoginFlowWithTotpMethod)
    case typeUpdateLoginFlowWithWebAuthnMethod(UpdateLoginFlowWithWebAuthnMethod)

    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        switch self {
        case .typeUpdateLoginFlowWithCodeMethod(let value):
            try container.encode(value)
        case .typeUpdateLoginFlowWithLookupSecretMethod(let value):
            try container.encode(value)
        case .typeUpdateLoginFlowWithOidcMethod(let value):
            try container.encode(value)
        case .typeUpdateLoginFlowWithPasswordMethod(let value):
            try container.encode(value)
        case .typeUpdateLoginFlowWithTotpMethod(let value):
            try container.encode(value)
        case .typeUpdateLoginFlowWithWebAuthnMethod(let value):
            try container.encode(value)
        }
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if let value = try? container.decode(UpdateLoginFlowWithCodeMethod.self) {
            self = .typeUpdateLoginFlowWithCodeMethod(value)
        } else if let value = try? container.decode(UpdateLoginFlowWithLookupSecretMethod.self) {
            self = .typeUpdateLoginFlowWithLookupSecretMethod(value)
        } else if let value = try? container.decode(UpdateLoginFlowWithOidcMethod.self) {
            self = .typeUpdateLoginFlowWithOidcMethod(value)
        } else if let value = try? container.decode(UpdateLoginFlowWithPasswordMethod.self) {
            self = .typeUpdateLoginFlowWithPasswordMethod(value)
        } else if let value = try? container.decode(UpdateLoginFlowWithTotpMethod.self) {
            self = .typeUpdateLoginFlowWithTotpMethod(value)
        } else if let value = try? container.decode(UpdateLoginFlowWithWebAuthnMethod.self) {
            self = .typeUpdateLoginFlowWithWebAuthnMethod(value)
        } else {
            throw DecodingError.typeMismatch(Self.Type.self, .init(codingPath: decoder.codingPath, debugDescription: "Unable to decode instance of UpdateLoginFlowBody"))
        }
    }
}
