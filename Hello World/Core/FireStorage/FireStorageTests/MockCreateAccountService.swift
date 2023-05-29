//
//  MockCreateAccount.swift
//  FireStorageTests
//
//  Created by Jessica Serqueira on 29/05/23.
//

import XCTest
import FirebaseAuth
@testable import FireStorage

class MockCreateAccountService: CreateAccountServiceProtocol {
    var signUpCalled = false
    var uploadPhotoCalled = false
    var createUserCalled = false
    
    var signUpEmail: String?
    var signUpPassword: String?
    var signUpImage: UIImage?
    var signUpName: String?
    
    var uploadPhotoImage: UIImage?
    var uploadPhotoName: String?
    
    var createUserPhotoUrl: URL?
    var createUserName: String?
    
    func signUp(withEmail email: String, password: String, image: UIImage, name: String, completion: @escaping (String?) -> Void) {
        signUpCalled = true
        signUpEmail = email
        signUpPassword = password
        signUpImage = image
        signUpName = name

        completion(nil)
    }
    
    func uploadPhoto(image: UIImage, name: String, completion: @escaping (String?) -> Void) {
        uploadPhotoCalled = true
        uploadPhotoImage = image
        uploadPhotoName = name
        
        completion(nil)
    }
    
    func createUser(photoUrl: URL, name: String, completion: @escaping (String?) -> Void) {
        createUserCalled = true
        createUserPhotoUrl = photoUrl
        createUserName = name
        
        completion(nil)
    }
}
