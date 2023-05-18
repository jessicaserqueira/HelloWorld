//
//  File.swift
//  HelloWorld
//
//  Created by Jessica Serqueira on 17/05/23.
//

import Swinject
import Domain
import AppData
import FireStorage


class DataAssembly: Assembly {
    
    func assemble(container: Container) {
    
        assembleLogin(container)
        assembleCreateAccount(container)
    }
    
    // MARK: - Methods
    private func assembleLogin(_ container: Container) {
        container.autoregister(Domain.LoginRepository.self, initializer: LoginRepository.init)
    }
    
    private func assembleCreateAccount(_ container: Container) {
        container.autoregister(Domain.CreateAccountRepository.self, initializer: CreateAccountRepository.init)
    }
}
