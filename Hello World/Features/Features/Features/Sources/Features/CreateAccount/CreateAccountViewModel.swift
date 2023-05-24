//
//  CreateAccountViewModel.swift
//  HelloWorld
//
//  Created by Jessica Serqueira on 15/05/23.
//

import SwiftUI
import Common
import Domain

public class CreateAccountViewModel: ObservableObject {
    
    private var coordinator: CreateAccountCoordinating?
    @Published public var createAccount = CreateAccountModel(name: "", email: "", password: "")
    @Published public var image = UIImage()
    @Published public var isLoading: Bool = false
    @Published public var formInvalid = false
    public var alertText = ""
    
    private var createAccountUseCase: CreateAccountUseCaseProtocol?
    
    public init(coordinator: CreateAccountCoordinating?, createAccountUseCase: CreateAccountUseCaseProtocol?) {
        self.coordinator = coordinator
        self.createAccountUseCase = createAccountUseCase
    }
}
extension CreateAccountViewModel: CreateAccountModelling {
    
    public var isButtonDisabled: Bool {
        let isValidName = AccountValidator.isValidName(createAccount.name)
        let isValidEmail = AccountValidator.isValidEmail(createAccount.email)
        let isValidPassword = AccountValidator.isValidPassword(createAccount.password)
        return createAccount.name.isEmpty || !isValidName ||
        createAccount.email.isEmpty || !isValidEmail ||
        createAccount.password.isEmpty || !isValidPassword ||
        image.size.width <= 0
    }
    
    public func returnLoginView() {
        print("return")
        coordinator?.returnLoginView()
    }
    
    public func dismissModal() {
        coordinator?.dismissModal()
    }
    
    public func buttonCreateAccount() {
        print("nome: \(createAccount.name), email: \(createAccount.email), senha: \(createAccount.password)")
        
        if (image.size.width <= 0) {
            formInvalid = true
            alertText = "Selecione uma foto"
            return
        }
        isLoading = true
        createAccountUseCase?.signUp(withEmail: createAccount.email, password: createAccount.password, image: image, name: createAccount.name) { err in
            if let err = err {
                self.formInvalid = true
                self.alertText = err
                print(err)
            }
            self.isLoading = false
        }
    }
}
