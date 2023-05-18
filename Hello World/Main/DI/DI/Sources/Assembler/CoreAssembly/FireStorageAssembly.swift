//
//  2.swift
//  HelloWorld
//
//  Created by Jessica Serqueira on 17/05/23.
//

import Swinject
import AppData
import FireStorage

class FireStorageAssembly: Assembly {
    
    func assemble(container: Container) {
        
        assembleBaseFireStorageLayer(container)
        assembleDataSources(container)
    }
    
    // MARK: - Methods
    private func assembleBaseFireStorageLayer(_ container: Container) {
        container.autoregister(LoginService.self) { _ in LoginService() }
        container.autoregister(CreateAccountService.self) { _ in CreateAccountService() }
    }
    
    private func assembleDataSources(_ container: Container) {
        
        container.autoregister(AppData.LoginDataSource.self, initializer:LoginDataSource.init)
        container.autoregister(AppData.CreateAccountDataSource.self, initializer: CreateAccountDataSource.init)
    }
}
