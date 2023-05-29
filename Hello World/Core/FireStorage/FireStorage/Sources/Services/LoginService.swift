//
//  LoginService.swift
//  FireStorage
//
//  Created by Jessica Serqueira on 15/05/23.
//

import FirebaseAuth
import Firebase
import AppData
import SwiftUI


public protocol LoginServiceProtocol {
    func loginAuthentication(email: String, password: String, completion: @escaping (Result<Void, Error>) -> Void)
}

public class LoginService: LoginServiceProtocol {
    
    public init() {}
    
    public func loginAuthentication(email: String, password: String, completion: @escaping (Result<Void, Error>) -> Void) {
        Auth.auth().signIn(withEmail: email, password: password) { result, error in
            if let error = error {
                print(error)
                completion(.failure(error))
            } else {
                guard let user = result?.user else {
                    completion(.failure(NSError(domain: "", code: 0, userInfo: nil)))
                    return
                }
                print("usuário logado \(user.uid)")
                completion(.success(()))
            }
        }
    }
}
