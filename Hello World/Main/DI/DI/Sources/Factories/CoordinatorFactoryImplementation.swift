//
//  File.swift
//  HelloWorld
//
//  Created by Jessica Serqueira on 17/05/23.
//

import Common
import Features
import Swinject

class CoordinatorFactoryImplementation: CoordinatorFactory {
    
    private let container: Resolver
    
    required init(container: Resolver) {
        self.container = container
    }
    
    
    // MARK: - LoginCoordinator
    func makeLoginCoordinator() -> LoginCoordinator {
        let coordinator =  container.resolveSafe(LoginCoordinator.self)
        return coordinator
    }
    
    // MARK: - CreateAccountCoordinator
    func makeCreateAccountCoordinator() -> CreateAccountCoordinator {
        let coordinator =  container.resolveSafe(CreateAccountCoordinator.self)
        return coordinator
    }

}
