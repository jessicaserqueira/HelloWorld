//
//  File.swift
//  Features
//
//  Created by Jessica Serqueira on 05/06/23.
//
import Foundation
import Domain

public struct ProfileModel {
    
    public var profile: Profile
    public var bio: String
    
    public init(_ profile: Profile, bio: String) {
        self.profile = profile
        self.bio = bio
    }
}

extension ProfileModel {
    
    public var  uuid: String {
        profile.uuid
    }
    
    public var name: String {
        profile.name
    }
    
    public var email: String {
        profile.email
    }
    
    public var profileUrl: String {
        profile.profileUrl
    }
}
