//
//  File.swift
//  HelloWorld
//
//  Created by Jessica Serqueira on 17/05/23.
//

import Swinject
import Common
import Features
import Domain
import SwiftUI

class LoginAssembly: Assembly {
    func assemble(container: Container) {
        let loginCoordinator = container.resolveSafe(LoginCoordinator.self)
        container.register(LoginCoordinating.self) { _ in loginCoordinator }
        
        // MARK: - LoginViewModel
        container.autoregister((any LoginModelling).self, initializer: LoginViewModel.init)
        container.register((any LoginModelling).self) { (resolver: Resolver) in
            return LoginViewModel(coordinator: resolver.resolveSafe(LoginCoordinating.self), loginUseCase: resolver.resolveSafe(LoginUseCaseProtocol.self))
            
        }
    }
}
