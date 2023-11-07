//
// QuotaUsage.swift
//
// Generated by openapi-generator
// https://openapi-generator.tech
//

import Foundation
#if canImport(AnyCodable)
import AnyCodable
#endif

public struct QuotaUsage: Codable, JSONEncodable, Hashable {

    public enum Feature: String, Codable, CaseIterable {
        case regionEu = "region_eu"
        case regionUs = "region_us"
        case regionApac = "region_apac"
        case regionGlobal = "region_global"
        case productionProjects = "production_projects"
        case dailyActiveUsers = "daily_active_users"
        case customDomains = "custom_domains"
        case sla = "sla"
        case collaboratorSeats = "collaborator_seats"
        case edgeCache = "edge_cache"
        case brandingThemes = "branding_themes"
        case zendeskSupport = "zendesk_support"
        case projectMetrics = "project_metrics"
        case projectMetricsTimeWindow = "project_metrics_time_window"
        case organizations = "organizations"
        case ropGrant = "rop_grant"
        case rateLimitTier = "rate_limit_tier"
        case sessionRateLimitTier = "session_rate_limit_tier"
        case identitiesListRateLimitTier = "identities_list_rate_limit_tier"
    }
    /** The additional price per unit in cents. */
    public var additionalPrice: Int64
    public var canUseMore: Bool
    /**  region_eu RegionEU region_us RegionUS region_apac RegionAPAC region_global RegionGlobal production_projects ProductionProjects daily_active_users DailyActiveUsers custom_domains CustomDomains sla SLA collaborator_seats CollaboratorSeats edge_cache EdgeCache branding_themes BrandingThemes zendesk_support ZendeskSupport project_metrics ProjectMetrics project_metrics_time_window ProjectMetricsTimeWindow organizations Organizations rop_grant ResourceOwnerPasswordGrant rate_limit_tier RateLimitTier session_rate_limit_tier RateLimitTierSessions identities_list_rate_limit_tier RateLimitTierIdentitiesList */
    public var feature: Feature
    public var featureAvailable: Bool
    public var included: Int64
    public var used: Int64

    public init(additionalPrice: Int64, canUseMore: Bool, feature: Feature, featureAvailable: Bool, included: Int64, used: Int64) {
        self.additionalPrice = additionalPrice
        self.canUseMore = canUseMore
        self.feature = feature
        self.featureAvailable = featureAvailable
        self.included = included
        self.used = used
    }

    public enum CodingKeys: String, CodingKey, CaseIterable {
        case additionalPrice = "additional_price"
        case canUseMore = "can_use_more"
        case feature
        case featureAvailable = "feature_available"
        case included
        case used
    }

    // Encodable protocol methods

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(additionalPrice, forKey: .additionalPrice)
        try container.encode(canUseMore, forKey: .canUseMore)
        try container.encode(feature, forKey: .feature)
        try container.encode(featureAvailable, forKey: .featureAvailable)
        try container.encode(included, forKey: .included)
        try container.encode(used, forKey: .used)
    }
}

