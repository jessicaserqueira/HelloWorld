//
//  File.swift
//  DI
//
//  Created by Jessica Serqueira on 23/05/23.
//

import Swinject
import Domain
import Features

class ViewsFactoryImplementation: ViewModelFactory {
    
    // MARK: - Properties
    private let container: Resolver
    
    required init(container: Resolver) {
        self.container = container
    }
    
    func makeLoginViewModel() -> Features.LoginViewModel {
        guard let viewModel = container.resolveSafe((any LoginModelling).self) as? LoginViewModel else {
            preconditionFailure("LoginViewPresenting is nil")
        }
        return viewModel
    }
    
    func makeCreateAccountViewModel() -> Features.CreateAccountViewModel {
        guard let viewModel = container.resolveSafe((any CreateAccountModelling).self) as? CreateAccountViewModel else {
            preconditionFailure("LoginViewPresenting is nil")
        }
        return viewModel
    }
    
    func makeProfileViewModel() -> Features.ProfileViewModel {
        guard let viewModel = container.resolveSafe((any ProfileModelling).self) as? ProfileViewModel else {
            preconditionFailure("LoginViewPresenting is nil")
        }
        return viewModel
    }
}
