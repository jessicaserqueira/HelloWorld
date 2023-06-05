//
//  MockCreateAccountUseCase.swift
//  FeaturesTests
//
//  Created by Jessica Serqueira on 31/05/23.
//

import XCTest
import Domain

final class MockCreateAccountUseCase: CreateAccountUseCaseProtocol {
    var signUpCalled = false
    var signUpName: String?
    var signUpEmail: String?
    var signUpPassword: String?
    var signUpImage: UIImage?
    var signUpCompletion: ((String?) -> Void)?

    func signUp(withEmail email: String, password: String, image: UIImage, name: String, completion: @escaping (String?) -> Void) {
        signUpCalled = true
        signUpName = name
        signUpEmail = email
        signUpPassword = password
        signUpImage = image
        signUpCompletion = completion
    }
}
