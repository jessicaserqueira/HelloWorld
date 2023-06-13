//
//  File.swift
//  AppData
//
//  Created by Jessica Serqueira on 13/06/23.
//

import Foundation
import Domain

public struct ProfileRepository {
    private let remote: ProfileDataSource
    
    public init(remote: ProfileDataSource) {
        self.remote = remote
    }
}

extension ProfileRepository: Domain.ProfileRepository {
    public func fetchProfile(completion: @escaping ([Domain.Profile]) -> Void) {
        remote.fetchProfile { profiles in
            let domainProfiles = profiles.map { profileDTO in
                Domain.Profile(uuid: profileDTO.uuid,
                               name: profileDTO.name,
                               email: profileDTO.email,
                               profileUrl: profileDTO.profileUrl)
            }
            completion(domainProfiles)
        }
    }
}
