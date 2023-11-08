//
// MemberInvite.swift
//
// Generated by openapi-generator
// https://openapi-generator.tech
//

import Foundation
#if canImport(AnyCodable)
import AnyCodable
#endif

public struct MemberInvite: Codable, JSONEncodable, Hashable {

    public enum Status: String, Codable, CaseIterable {
        case pending = "pending"
        case accepted = "accepted"
        case declined = "declined"
        case expired = "expired"
        case cancelled = "cancelled"
        case removed = "removed"
    }
    /** The Project's Revision Creation Date */
    public var createdAt: Date
    /** The invite's ID. */
    public var id: String
    /** The invitee's email */
    public var inviteeEmail: String
    public var inviteeId: String?
    /** The invite owner's email Usually the project's owner email */
    public var ownerEmail: String
    /** The invite owner's ID Usually the project's owner */
    public var ownerId: String
    /** The Project's ID this invite is associated with */
    public var projectId: String
    /** The invite's status Keeps track of the invites status such as pending, accepted, declined, expired pending PENDING accepted ACCEPTED declined DECLINED expired EXPIRED cancelled CANCELLED removed REMOVED */
    public var status: Status
    /** Last Time Project's Revision was Updated */
    public var updatedAt: Date

    public init(createdAt: Date, id: String, inviteeEmail: String, inviteeId: String? = nil, ownerEmail: String, ownerId: String, projectId: String, status: Status, updatedAt: Date) {
        self.createdAt = createdAt
        self.id = id
        self.inviteeEmail = inviteeEmail
        self.inviteeId = inviteeId
        self.ownerEmail = ownerEmail
        self.ownerId = ownerId
        self.projectId = projectId
        self.status = status
        self.updatedAt = updatedAt
    }

    public enum CodingKeys: String, CodingKey, CaseIterable {
        case createdAt = "created_at"
        case id
        case inviteeEmail = "invitee_email"
        case inviteeId = "invitee_id"
        case ownerEmail = "owner_email"
        case ownerId = "owner_id"
        case projectId = "project_id"
        case status
        case updatedAt = "updated_at"
    }

    // Encodable protocol methods

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(createdAt, forKey: .createdAt)
        try container.encode(id, forKey: .id)
        try container.encode(inviteeEmail, forKey: .inviteeEmail)
        try container.encodeIfPresent(inviteeId, forKey: .inviteeId)
        try container.encode(ownerEmail, forKey: .ownerEmail)
        try container.encode(ownerId, forKey: .ownerId)
        try container.encode(projectId, forKey: .projectId)
        try container.encode(status, forKey: .status)
        try container.encode(updatedAt, forKey: .updatedAt)
    }
}
