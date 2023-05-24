//
//  LoginViewModel.swift
//  HelloWorld
//
//  Created by Jessica Serqueira on 15/05/23.
//

import SwiftUI
import Common
import Domain

public class LoginViewModel: ObservableObject {
    private var coordinator: LoginCoordinating?
    @Published public var loginModel = LoginAuthenticationModel(email: "", password: "")
    @Published public var formInvalid = false
    public var alertText = ""
    
    var loginUseCase: LoginUseCaseProtocol

    public init(coordinator: LoginCoordinating?, loginUseCase: LoginUseCaseProtocol) {
        self.coordinator = coordinator
        self.loginUseCase = loginUseCase
    }
}

extension LoginViewModel: LoginModelling {

    public func loginAuthentication(email: String, password: String) {
        loginUseCase.loginAuthentication(email: loginModel.email, password: loginModel.password) { [weak self]
            result in
            switch result {
            case .success(()):
                self?.coordinator?.loginValidation(email: email, password: password)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
     public func createAccount() {
        print("criar conta")
        coordinator?.createAccount()
    }
}
