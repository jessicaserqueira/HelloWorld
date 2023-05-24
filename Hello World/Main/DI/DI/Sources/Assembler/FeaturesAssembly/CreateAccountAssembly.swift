//
//  File.swift
//  DI
//
//  Created by Jessica Serqueira on 24/05/23.
//

import Swinject
import Common
import Features
import Domain
import SwiftUI

class CreateAccountAssembly: Assembly {
    func assemble(container: Container) {
        let createAccountCoordinator = container.resolveSafe(CreateAccountCoordinator.self)
        container.register(CreateAccountCoordinating.self) { _ in createAccountCoordinator }
        
        // MARK: - CreateAccountViewModel
        container.autoregister((any CreateAccountModelling).self, initializer: CreateAccountViewModel.init)
        container.register((any CreateAccountModelling).self) { (resolver: Resolver) in
            return CreateAccountViewModel(coordinator: resolver.resolveSafe(CreateAccountCoordinating.self), createAccountUseCase: resolver.resolveSafe(CreateAccountUseCaseProtocol.self))
        }
    }
}
