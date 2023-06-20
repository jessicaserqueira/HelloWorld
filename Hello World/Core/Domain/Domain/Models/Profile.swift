//
//  File.swift
//  Domain
//
//  Created by Jessica Serqueira on 13/06/23.
//

import Foundation

public struct Profile: Hashable {
    public var uuid: String
    public var name: String
    public var email: String
    public var profileUrl: String
    
    public init(uuid: String, name: String, email: String, profileUrl: String) {
        self.uuid = uuid
        self.name = name
        self.email = email
        self.profileUrl = profileUrl
    }
}
