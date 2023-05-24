//
//  File.swift
//  HelloWorld
//
//  Created by Jessica Serqueira on 17/05/23.
//
import SwinjectAutoregistration
import Swinject
import Domain
import AppData
import FireStorage


class DataAssembly: Assembly {
    
    func assemble(container: Container) {
    
        container.autoregister(Domain.LoginRepository.self, initializer: AppData.LoginRepository.init)
        container.autoregister(Domain.CreateAccountRepository.self, initializer: AppData.CreateAccountRepository.init)
    }
}
