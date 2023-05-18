//
//  LoginViewModelling.swift
//  HelloWorld
//
//  Created by Jessica Serqueira on 15/05/23.
//

import SwiftUI

public protocol LoginModelling: ObservableObject {
    var loginModel: LoginAuthenticationModel { get set }
    var formInvalid: Bool { get set }
    var alertText: String { get }
    
    func loginAuthentication(email: String, password: String)
    func createAccount()
}
