//
//  1.swift
//  HelloWorld
//
//  Created by Jessica Serqueira on 17/05/23.
//

import SwinjectAutoregistration
import Swinject
import Domain

class DomainAssembly: Assembly {
    
    func assemble(container: Container) {
        
        container.autoregister(Domain.LoginUseCaseProtocol.self, initializer: LoginUseCase.init)
        container.autoregister(Domain.CreateAccountUseCaseProtocol.self, initializer: CreateAccountUseCase.init)
    }
}
