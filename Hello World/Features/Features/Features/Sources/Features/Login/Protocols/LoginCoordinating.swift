//
//  LoginCoordinating.swift
//  HelloWorld
//
//  Created by Jessica Serqueira on 15/05/23.
//

import Foundation

public protocol LoginCoordinating {
    func loginValidation(email: String, password: String)
    func createAccount()
}
