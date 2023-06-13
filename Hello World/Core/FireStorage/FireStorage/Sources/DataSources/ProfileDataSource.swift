//
//  File.swift
//  FireStorage
//
//  Created by Jessica Serqueira on 13/06/23.
//

import Foundation
import AppData

public class ProfileDataSource {
    private let profile: ProfileService
    
    public init(profile: ProfileService) {
        self.profile = profile
    }
}

extension ProfileDataSource: AppData.ProfileDataSource {
    public func fetchContacts(completion: @escaping ([AppData.ProfileDTO]) -> Void) {
        profile.getProfile { profiles in
            let appDataProfiles = profiles.map { profile in
                AppData.ProfileDTO(uuid: profile.uuid,
                                   name: profile.name,
                                   email: profile.email,
                                   profileUrl: profile.profileUrl)
            }
            completion(appDataProfiles)
        }
    }
}
