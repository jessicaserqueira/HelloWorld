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
    @Published var profile: [ProfileModel] = []
    
    public var profileUseCase: ProfileUseCaseProtocol
    
    public init(coordinator: ProfileCoordinating?, profileUseCase: ProfileUseCaseProtocol) {
        self.coordinator = coordinator
        self.profileUseCase = profileUseCase
    }
}

extension ProfileViewModel: ProfileModelling {
    public func updateProfile() {
    }
}
