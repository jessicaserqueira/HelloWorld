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
        container.register(LoginService.self) { _ in LoginService() }
        container.register(CreateAccountService.self) { _ in CreateAccountService() }
        
        
        container.autoregister(AppData.LoginDataSource.self, initializer: FireStorage.LoginDataSource.init)
        container.autoregister(AppData.CreateAccountDataSource.self, initializer: FireStorage.CreateAccountDataSource.init)
    }
}
