//
//  File.swift
//  HelloWorld
//
//  Created by Jessica Serqueira on 17/05/23.
//


import Common
import Features
import SwiftUI
import Domain
import Swinject

class LoginAssembly: Assembly {
    
    func assemble(container: Container) {
        
        let loginCoordinator = container.resolveSafe(LoginCoordinator.self)
        container.register(LoginCoordinating.self) { _ in loginCoordinator }
        
        // MARK: - LoginViewModel
        container.register((any LoginModelling).self) { resolver in
            let coordinator = resolver.resolve(LoginCoordinator.self)!
            let loginUseCase = resolver.resolve(Domain.LoginUseCaseProtocol.self)!
            return LoginViewModel(coordinator: coordinator)
        }
    }
}
