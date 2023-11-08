//
// NormalizedProjectRevisionHook.swift
//
// Generated by openapi-generator
// https://openapi-generator.tech
//

import Foundation
#if canImport(AnyCodable)
import AnyCodable
#endif

public struct NormalizedProjectRevisionHook: Codable, JSONEncodable, Hashable {

    /** The Hooks Config Key */
    public var configKey: String
    /** The Project's Revision Creation Date */
    public var createdAt: Date?
    /** The Hook Type */
    public var hook: String
    /** ID of the entry */
    public var id: String?
    /** The Revision's ID this schema belongs to */
    public var projectRevisionId: String?
    /** Last Time Project's Revision was Updated */
    public var updatedAt: Date?
    /** Whether to send the API Key in the HTTP Header or as a HTTP Cookie */
    public var webHookConfigAuthApiKeyIn: String?
    /** The name of the api key */
    public var webHookConfigAuthApiKeyName: String?
    /** The value of the api key */
    public var webHookConfigAuthApiKeyValue: String?
    /** The password to be sent in the HTTP Basic Auth Header */
    public var webHookConfigAuthBasicAuthPassword: String?
    /** The username to be sent in the HTTP Basic Auth Header */
    public var webHookConfigAuthBasicAuthUser: String?
    /** HTTP Auth Method to use for the Web-Hook */
    public var webHookConfigAuthType: String?
    /** URI pointing to the JsonNet template used for Web-Hook payload generation. Only used for those HTTP methods, which support HTTP body payloads. */
    public var webHookConfigBody: String?
    /** If enabled allows the web hook to interrupt / abort the self-service flow. It only applies to certain flows (registration/verification/login/settings) and requires a valid response format. */
    public var webHookConfigCanInterrupt: Bool?
    /** The HTTP method to use (GET, POST, etc) for the Web-Hook */
    public var webHookConfigMethod: String?
    /** Whether to ignore the Web Hook response */
    public var webHookConfigResponseIgnore: Bool?
    /** Whether to parse the Web Hook response */
    public var webHookConfigResponseParse: Bool?
    /** The URL the Web-Hook should call */
    public var webHookConfigUrl: String?

    public init(configKey: String, createdAt: Date? = nil, hook: String, id: String? = nil, projectRevisionId: String? = nil, updatedAt: Date? = nil, webHookConfigAuthApiKeyIn: String? = nil, webHookConfigAuthApiKeyName: String? = nil, webHookConfigAuthApiKeyValue: String? = nil, webHookConfigAuthBasicAuthPassword: String? = nil, webHookConfigAuthBasicAuthUser: String? = nil, webHookConfigAuthType: String? = nil, webHookConfigBody: String? = nil, webHookConfigCanInterrupt: Bool? = nil, webHookConfigMethod: String? = nil, webHookConfigResponseIgnore: Bool? = nil, webHookConfigResponseParse: Bool? = nil, webHookConfigUrl: String? = nil) {
        self.configKey = configKey
        self.createdAt = createdAt
        self.hook = hook
        self.id = id
        self.projectRevisionId = projectRevisionId
        self.updatedAt = updatedAt
        self.webHookConfigAuthApiKeyIn = webHookConfigAuthApiKeyIn
        self.webHookConfigAuthApiKeyName = webHookConfigAuthApiKeyName
        self.webHookConfigAuthApiKeyValue = webHookConfigAuthApiKeyValue
        self.webHookConfigAuthBasicAuthPassword = webHookConfigAuthBasicAuthPassword
        self.webHookConfigAuthBasicAuthUser = webHookConfigAuthBasicAuthUser
        self.webHookConfigAuthType = webHookConfigAuthType
        self.webHookConfigBody = webHookConfigBody
        self.webHookConfigCanInterrupt = webHookConfigCanInterrupt
        self.webHookConfigMethod = webHookConfigMethod
        self.webHookConfigResponseIgnore = webHookConfigResponseIgnore
        self.webHookConfigResponseParse = webHookConfigResponseParse
        self.webHookConfigUrl = webHookConfigUrl
    }

    public enum CodingKeys: String, CodingKey, CaseIterable {
        case configKey = "config_key"
        case createdAt = "created_at"
        case hook
        case id
        case projectRevisionId = "project_revision_id"
        case updatedAt = "updated_at"
        case webHookConfigAuthApiKeyIn = "web_hook_config_auth_api_key_in"
        case webHookConfigAuthApiKeyName = "web_hook_config_auth_api_key_name"
        case webHookConfigAuthApiKeyValue = "web_hook_config_auth_api_key_value"
        case webHookConfigAuthBasicAuthPassword = "web_hook_config_auth_basic_auth_password"
        case webHookConfigAuthBasicAuthUser = "web_hook_config_auth_basic_auth_user"
        case webHookConfigAuthType = "web_hook_config_auth_type"
        case webHookConfigBody = "web_hook_config_body"
        case webHookConfigCanInterrupt = "web_hook_config_can_interrupt"
        case webHookConfigMethod = "web_hook_config_method"
        case webHookConfigResponseIgnore = "web_hook_config_response_ignore"
        case webHookConfigResponseParse = "web_hook_config_response_parse"
        case webHookConfigUrl = "web_hook_config_url"
    }

    // Encodable protocol methods

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(configKey, forKey: .configKey)
        try container.encodeIfPresent(createdAt, forKey: .createdAt)
        try container.encode(hook, forKey: .hook)
        try container.encodeIfPresent(id, forKey: .id)
        try container.encodeIfPresent(projectRevisionId, forKey: .projectRevisionId)
        try container.encodeIfPresent(updatedAt, forKey: .updatedAt)
        try container.encodeIfPresent(webHookConfigAuthApiKeyIn, forKey: .webHookConfigAuthApiKeyIn)
        try container.encodeIfPresent(webHookConfigAuthApiKeyName, forKey: .webHookConfigAuthApiKeyName)
        try container.encodeIfPresent(webHookConfigAuthApiKeyValue, forKey: .webHookConfigAuthApiKeyValue)
        try container.encodeIfPresent(webHookConfigAuthBasicAuthPassword, forKey: .webHookConfigAuthBasicAuthPassword)
        try container.encodeIfPresent(webHookConfigAuthBasicAuthUser, forKey: .webHookConfigAuthBasicAuthUser)
        try container.encodeIfPresent(webHookConfigAuthType, forKey: .webHookConfigAuthType)
        try container.encodeIfPresent(webHookConfigBody, forKey: .webHookConfigBody)
        try container.encodeIfPresent(webHookConfigCanInterrupt, forKey: .webHookConfigCanInterrupt)
        try container.encodeIfPresent(webHookConfigMethod, forKey: .webHookConfigMethod)
        try container.encodeIfPresent(webHookConfigResponseIgnore, forKey: .webHookConfigResponseIgnore)
        try container.encodeIfPresent(webHookConfigResponseParse, forKey: .webHookConfigResponseParse)
        try container.encodeIfPresent(webHookConfigUrl, forKey: .webHookConfigUrl)
    }
}
