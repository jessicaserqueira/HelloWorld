//
//  1.swift
//  HelloWorld
//
//  Created by Jessica Serqueira on 17/05/23.
//

import Swinject
import Domain

class DomainAssembly: Assembly {
    
    func assemble(container: Container) {
        assembleLogin(container)
        assembleCreateAccount(container)
        
    }
    
    // MARK: - Methods
    private func assembleLogin(_ container: Container) {
        container.register(Domain.LoginUseCaseProtocol.self) { r in
            let repository = r.resolveSafe(Domain.LoginRepository.self)
            return LoginUseCase(loginRepository: repository)
        }
    }
    
    private func assembleCreateAccount(_ container: Container) {
        container.register(Domain.CreateAccountUseCaseProtocol.self) { r in
            let repository = r.resolveSafe(Domain.CreateAccountRepository.self)
            return CreateAccountUseCase(createAccountRepository: repository)
        }
    }
}
