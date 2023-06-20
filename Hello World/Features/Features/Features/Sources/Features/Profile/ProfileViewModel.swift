//
//  File.swift
//  Features
//
//  Created by Jessica Serqueira on 05/06/23.
//

import SwiftUI
import Domain

public class ProfileViewModel: ObservableObject {
    
    private var coordinator: ProfileCoordinating?
    @Published public var image = UIImage()
    @Published public var isLoading = false
    @Published var profile: [ProfileModel] = []
    
    var isLoaded = false
    
    public var profileUseCase: ProfileUseCaseProtocol
    
    public init(coordinator: ProfileCoordinating?, profileUseCase: ProfileUseCaseProtocol) {
        self.coordinator = coordinator
        self.profileUseCase = profileUseCase
    }
}

extension ProfileViewModel: ProfileModelling {
    public func updateProfile() {
        isLoading = true
        
        profileUseCase.fetchProfile { [weak self] profiles in
            let profileModels = profiles.map { profile in
                ProfileModel(profile, bio: "") 
            }
            
            DispatchQueue.main.async {
                self?.profile = profileModels
                self?.isLoading = false
            }
        }
    }

}
