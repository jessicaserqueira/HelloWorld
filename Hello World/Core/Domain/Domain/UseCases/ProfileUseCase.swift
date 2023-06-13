//
//  File.swift
//  Domain
//
//  Created by Jessica Serqueira on 13/06/23.
//

import Foundation

public class ProfileUseCase {
    private let profileRepository: ProfileRepository
    
    public init(profileRepository: ProfileRepository) {
        self.profileRepository = profileRepository
    }
}

extension ProfileUseCase: ProfileUseCaseProtocol {
    public func fetchContacts(completion: @escaping ([Profile]) -> Void) {
        profileRepository.fetchProfile(completion: completion)
    }
}
