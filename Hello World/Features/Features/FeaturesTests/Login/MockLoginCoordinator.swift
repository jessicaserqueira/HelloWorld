//
//  FeaturesTests.swift
//  FeaturesTests
//
//  Created by Jessica Serqueira on 17/05/23.
//

import XCTest
import Common
@testable import Features

class MockLoginCoordinator: LoginCoordinating {
    
    var loginValidationCalled = false
    var createAccountCalled = false

    func loginValidation() {
        loginValidationCalled = true
    }

    func createAccount() {
        createAccountCalled = true
    }
}
