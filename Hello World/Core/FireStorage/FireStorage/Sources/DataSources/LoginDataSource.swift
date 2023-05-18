//
//  LoginDataSource.swift
//  FireStorage
//
//  Created by Jessica Serqueira on 17/05/23.
//

import Foundation
import AppData
import FirebaseAuth

public class LoginDataSource {
    private let loginService: LoginService
    
    public init(loginService: LoginService) {
        self.loginService = loginService
    }
}

extension LoginDataSource: AppData.LoginDataSource {
    public func loginAuthentication(email: String, password: String, completion: @escaping (Result<Void, Error>) -> Void) {
        loginService.loginAuthentication(email: email, password: password) { result in
            switch result {
            case .success(_):
                completion(.success(()))
            case .failure(let error):
                print("\(error.localizedDescription)")
                completion(.failure(error))
            }
        }
    }
}
