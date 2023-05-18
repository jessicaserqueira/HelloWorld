//
//  File.swift
//  AppData
//
//  Created by Jessica Serqueira on 17/05/23.
//

import Domain
import Foundation
import UIKit

public struct CreateAccountRepository {
    
    private let remote: CreateAccountDataSource
    
    public init(remote: CreateAccountDataSource) {
        self.remote = remote
    }
}

extension CreateAccountRepository: Domain.CreateAccountRepository {
    public func signUp(withEmail email: String, password: String, image: UIImage, name: String, completion: @escaping (String?) -> Void) {
        print("nome: \(name), email: \(email), senha: \(password)")
        
        if (image.size.width <= 0) {
            remote.formInvalid = true
            remote.alertText = "Selecione uma foto"
            return
        }
        
        remote.signUp(withEmail: email, password: password, image: image, name: name) { error in
            if let error = error {
                remote.formInvalid = true
                remote.alertText = error
                print(error)
            }
        }
    }
}
