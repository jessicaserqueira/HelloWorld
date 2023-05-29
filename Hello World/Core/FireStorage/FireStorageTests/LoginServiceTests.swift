//
//  LoginServiceTests.swift
//  FireStorageTests
//
//  Created by Jessica Serqueira on 24/05/23.
//

import XCTest
import FirebaseAuth
@testable import FireStorage

class LoginServiceTests: XCTestCase {
    var mockLoginService: MockLoginService!
    
    override func setUp() {
        super.setUp()
        mockLoginService = MockLoginService()
    }
    
    override func tearDown() {
        mockLoginService = nil
        super.tearDown()
    }
    
    func testLoginAuthentication_Successful() {
        
        let expectation = self.expectation(description: "Login authentication successful")
        let email = "test@gmail.com"
        let password = "15ioasys@A"
        
        mockLoginService.loginAuthentication(email: email, password: password) { result in
            switch result {
            case .success:
                expectation.fulfill()
            case .failure(let error):
                XCTFail("Login authentication should be successful. Error: \(error)")
            }
        }
        
        mockLoginService.completeLogin()
        
        waitForExpectations(timeout: 5, handler: nil)
        
        XCTAssertTrue(mockLoginService.signInCalled)
        XCTAssertEqual(mockLoginService.signInEmail, email)
        XCTAssertEqual(mockLoginService.signInPassword, password)
    }
    
    func testLoginAuthentication_Failure() {
        
        let expectation = self.expectation(description: "Login authentication failure")
        let email = "test@example.com"
        let password = "incorrectpassword"
        
        
        mockLoginService.loginAuthentication(email: email, password: password) { result in
            
            switch result {
            case .success:
                XCTFail("Login authentication should fail")
            case .failure:
                expectation.fulfill()
            }
        }
        
        let error = NSError(domain: "TestErrorDomain", code: 0, userInfo: nil)
        mockLoginService.failLogin(with: error)
        
        waitForExpectations(timeout: 5, handler: nil)
        
        XCTAssertTrue(mockLoginService.signInCalled)
        XCTAssertEqual(mockLoginService.signInEmail, email)
        XCTAssertEqual(mockLoginService.signInPassword, password)
    }
}
