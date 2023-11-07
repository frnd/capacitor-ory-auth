//
// UpdateSettingsFlowWithOidcMethod.swift
//
// Generated by openapi-generator
// https://openapi-generator.tech
//

import Foundation
#if canImport(AnyCodable)
import AnyCodable
#endif

/** Update Settings Flow with OpenID Connect Method */
public struct UpdateSettingsFlowWithOidcMethod: Codable, JSONEncodable, Hashable {

    /** Flow ID is the flow's ID.  in: query */
    public var flow: String?
    /** Link this provider  Either this or `unlink` must be set.  type: string in: body */
    public var link: String?
    /** Method  Should be set to profile when trying to update a profile. */
    public var method: String
    /** The identity's traits  in: body */
    public var traits: AnyCodable?
    /** Unlink this provider  Either this or `link` must be set.  type: string in: body */
    public var unlink: String?
    /** UpstreamParameters are the parameters that are passed to the upstream identity provider.  These parameters are optional and depend on what the upstream identity provider supports. Supported parameters are: `login_hint` (string): The `login_hint` parameter suppresses the account chooser and either pre-fills the email box on the sign-in form, or selects the proper session. `hd` (string): The `hd` parameter limits the login/registration process to a Google Organization, e.g. `mycollege.edu`. `prompt` (string): The `prompt` specifies whether the Authorization Server prompts the End-User for reauthentication and consent, e.g. `select_account`. */
    public var upstreamParameters: AnyCodable?

    public init(flow: String? = nil, link: String? = nil, method: String, traits: AnyCodable? = nil, unlink: String? = nil, upstreamParameters: AnyCodable? = nil) {
        self.flow = flow
        self.link = link
        self.method = method
        self.traits = traits
        self.unlink = unlink
        self.upstreamParameters = upstreamParameters
    }

    public enum CodingKeys: String, CodingKey, CaseIterable {
        case flow
        case link
        case method
        case traits
        case unlink
        case upstreamParameters = "upstream_parameters"
    }

    // Encodable protocol methods

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(flow, forKey: .flow)
        try container.encodeIfPresent(link, forKey: .link)
        try container.encode(method, forKey: .method)
        try container.encodeIfPresent(traits, forKey: .traits)
        try container.encodeIfPresent(unlink, forKey: .unlink)
        try container.encodeIfPresent(upstreamParameters, forKey: .upstreamParameters)
    }
}

