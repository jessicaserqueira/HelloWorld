//
//  File.swift
//  AppData
//
//  Created by Jessica Serqueira on 13/06/23.
//

import Domain
import Foundation

public struct ProfileDTO: Hashable {
    public let uuid: String
    public let name: String
    public let email: String
    public let profileUrl: String
    
    public init(uuid: String, name: String, email: String, profileUrl: String) {
        self.uuid = uuid
        self.name = name
        self.email = email
        self.profileUrl = profileUrl
    }
}

extension ProfileDTO {
    public var toDomain: Profile {
        .init(
            uuid: uuid,
            name: name,
            email: email,
            profileUrl: profileUrl
        )
    }
}
