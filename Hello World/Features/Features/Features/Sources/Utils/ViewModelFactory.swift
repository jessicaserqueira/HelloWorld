//
//  File.swift
//  Features
//
//  Created by Jessica Serqueira on 22/05/23.
//

import Swinject

public protocol ViewModelFactory: DependencyFactory {

    func makeLoginViewModel() -> LoginViewModel
    func makeCreateAccountViewModel() -> CreateAccountViewModel
    func makeProfileViewModel() -> ProfileViewModel

}
