//
//  File.swift
//  Domain
//
//  Created by Jessica Serqueira on 17/05/23.
//

import Foundation
import UIKit

public class CreateAccountUseCase {
    
    private let createAccountRepository: CreateAccountRepository
    
    public init(createAccountRepository: CreateAccountRepository) {
        self.createAccountRepository = createAccountRepository
    }
}

extension CreateAccountUseCase: CreateAccountUseCaseProtocol {
    public func signUp(withEmail email: String, password: String, image: UIImage, name: String, completion: @escaping (String?) -> Void) {
        createAccountRepository.signUp(withEmail: email, password: password, image: image, name: name, completion: completion)
    }
}
