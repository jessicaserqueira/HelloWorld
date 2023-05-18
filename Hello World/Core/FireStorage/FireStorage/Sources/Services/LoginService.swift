//
//  LoginService.swift
//  FireStorage
//
//  Created by Jessica Serqueira on 15/05/23.
//

import FirebaseAuth
import AppData
import SwiftUI

public class LoginService {
    
    public init() {}
    
    func loginAuthentication(email: String, password: String, completion: @escaping (Result<Void, Error>) -> Void) {
        Auth.auth().signIn(withEmail: email, password: password) { result, error in
            if let error = error {
                print(error)
                completion(.failure(error))
            } else {
                guard let user = result?.user else {
                    completion(.failure(NSError(domain: "", code: 0, userInfo: nil)))
                    return
                }
                print("usuario logado \(user.uid)")
                completion(.success(()))
            }
        }
    }
}
