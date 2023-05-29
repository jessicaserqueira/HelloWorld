//
//  LoginDataSourceTests.swift
//  FireStorageTests
//
//  Created by Jessica Serqueira on 24/05/23.
//

import XCTest
import FirebaseAuth
import FireStorage

class MockLoginService: LoginServiceProtocol {
    
    var signInCalled = false
    var signInEmail: String?
    var signInPassword: String?
    var signInCompletion: ((Result<Void, Error>) -> Void)?

    func loginAuthentication(email: String, password: String, completion: @escaping (Result<Void, Error>) -> Void) {
        signInCalled = true
        signInEmail = email
        signInPassword = password
        signInCompletion = completion
    }

    func completeLogin() {
        signInCompletion?(.success(()))
    }

    func failLogin(with error: Error) {
        signInCompletion?(.failure(error))
    }
}
