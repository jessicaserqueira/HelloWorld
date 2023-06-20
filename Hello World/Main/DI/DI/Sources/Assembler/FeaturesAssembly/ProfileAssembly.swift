//
//  File.swift
//  DI
//
//  Created by Jessica Serqueira on 06/06/23.
//

import Swinject
import Common
import Features
import Domain
import SwiftUI

class ProfileAssembly: Assembly {
    func assemble(container: Container) {
        let coordinator = container.resolveSafe(ProfileCoordinator.self)
        container.register(ProfileCoordinating.self) { _ in coordinator }
        
        // MARK: - ProfileViewModel
        container.autoregister((any ProfileModelling).self, initializer: ProfileViewModel.init)
        container.register((any ProfileModelling).self) { (resolver: Resolver) in
            return ProfileViewModel(coordinator: resolver.resolveSafe(ProfileCoordinating.self), profileUseCase: resolver.resolveSafe(Domain.ProfileUseCaseProtocol.self))
            
        }
    }
}
