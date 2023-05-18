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
        
    }
    
    private func assembleCreateAccount(_ container: Container) {
        
    }
}
