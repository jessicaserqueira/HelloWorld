//
//  File.swift
//  Domain
//
//  Created by Jessica Serqueira on 13/06/23.
//

import Foundation

public struct Profile: Hashable {
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
