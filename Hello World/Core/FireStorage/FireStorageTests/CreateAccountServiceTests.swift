//
//  CreateAccountServiceTests.swift
//  FireStorageTests
//
//  Created by Jessica Serqueira on 29/05/23.
//

import XCTest
import FirebaseAuth
@testable import FireStorage

class CreateAccountServiceTests: XCTestCase {
    var mockCreateAccountService: MockCreateAccountService!

    override func setUp() {
        super.setUp()
        mockCreateAccountService = MockCreateAccountService()
    }

    override func tearDown() {
        mockCreateAccountService = nil
        super.tearDown()
    }

    func testSignUp_Successful() {
        let expectation = self.expectation(description: "Sign-up successful")
        let email = "test@gmail.com"
        let password = "15ioasys@A"
        let image = UIImage()
        let name = "John Doe"

        mockCreateAccountService.signUp(withEmail: email, password: password, image: image, name: name) { error in
            XCTAssertNil(error)
            expectation.fulfill()
        }

        waitForExpectations(timeout: 5, handler: nil)

        XCTAssertTrue(mockCreateAccountService.signUpCalled)
        XCTAssertEqual(mockCreateAccountService.signUpEmail, email)
        XCTAssertEqual(mockCreateAccountService.signUpPassword, password)
        XCTAssertEqual(mockCreateAccountService.signUpImage, image)
        XCTAssertEqual(mockCreateAccountService.signUpName, name)
    }

    func testUploadPhoto_Successful() {
        let expectation = self.expectation(description: "Photo upload successful")
        let image = UIImage()
        let name = "photo.jpg"

        mockCreateAccountService.uploadPhoto(image: image, name: name) { error in
            XCTAssertNil(error)
            expectation.fulfill()
        }

        waitForExpectations(timeout: 5, handler: nil)

        XCTAssertTrue(mockCreateAccountService.uploadPhotoCalled)
        XCTAssertEqual(mockCreateAccountService.uploadPhotoImage, image)
        XCTAssertEqual(mockCreateAccountService.uploadPhotoName, name)
    }

    func testCreateUser_Successful() {
        let expectation = self.expectation(description: "User creation successful")
        let photoUrl = URL(string: "https://example.com/photo.jpg")!
        let name = "John Doe"

        mockCreateAccountService.createUser(photoUrl: photoUrl, name: name) { error in

            XCTAssertNil(error)
            expectation.fulfill()
        }

        waitForExpectations(timeout: 5, handler: nil)

        XCTAssertTrue(mockCreateAccountService.createUserCalled)
        XCTAssertEqual(mockCreateAccountService.createUserPhotoUrl, photoUrl)
        XCTAssertEqual(mockCreateAccountService.createUserName, name)
    }
}
