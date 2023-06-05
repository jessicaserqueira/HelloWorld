//
//  LoginViewModelTests.swift
//  FeaturesTests
//
//  Created by Jessica Serqueira on 29/05/23.
//

import XCTest
import Swinject
import Domain
import SwinjectAutoregistration
@testable import Features

class LoginViewModelTests: XCTestCase {
    private var container: Container!
    private var viewModel: LoginViewModel!
    
    override func setUp() {
        super.setUp()
        container = Container()
        container.autoregister(LoginUseCaseProtocol.self, initializer: MockLoginUseCase.init)
        container.autoregister(LoginCoordinating.self, initializer: MockLoginCoordinator.init)
        viewModel = LoginViewModel(coordinator: container.resolve(LoginCoordinating.self), loginUseCase: container.resolve(LoginUseCaseProtocol.self)!)
    }
    
    override func tearDown() {
        viewModel = nil
        container = nil
        super.tearDown()
    }
    
    func testLoginAuthenticationSuccess() {
        let loginUseCaseMock = container.resolve(LoginUseCaseProtocol.self) as! MockLoginUseCase
        let coordinatorMock = container.resolve(LoginCoordinating.self) as! MockLoginCoordinator

        let expectation = self.expectation(description: "Login authentication successful")
        let email = "test@gmail.com"
        let password = "15ioasys@A"

        viewModel.loginAuthentication(email: email, password: password)
        

        loginUseCaseMock.loginAuthentication(email: email, password: password) { result in
            switch result {
            case .success:
                expectation.fulfill()
            case .failure(let error):
                XCTFail("Login authentication should be successful. Error: \(error)")
            }
        }

        loginUseCaseMock.completeLogin()
        coordinatorMock.loginValidation()

        waitForExpectations(timeout: 5, handler: nil)

        XCTAssertTrue(loginUseCaseMock.signInCalled)
    }

    func testLoginAuthenticationFailure() {
        let loginUseCaseMock = container.resolve(LoginUseCaseProtocol.self) as! MockLoginUseCase
        let coordinatorMock = container.resolve(LoginCoordinating.self) as! MockLoginCoordinator

        let expectation = self.expectation(description: "Login authentication failure")
        let email = "test@example.com"
        let password = "incorrectpassword"

        viewModel.loginAuthentication(email: email, password: password)

        loginUseCaseMock.loginAuthentication(email: email, password: password) { result in
            switch result {
            case .success:
                XCTFail("Login authentication should fail")
            case .failure:
                expectation.fulfill()
            }
        }

        let error = NSError(domain: "TestErrorDomain", code: 0, userInfo: nil)
        loginUseCaseMock.failLogin(with: error)

        waitForExpectations(timeout: 5, handler: nil)

        XCTAssertTrue(loginUseCaseMock.signInCalled)
        XCTAssertEqual(loginUseCaseMock.signInEmail, email)
        XCTAssertEqual(loginUseCaseMock.signInPassword, password)
        XCTAssertFalse(coordinatorMock.loginValidationCalled)
    }

    func testCreateAccount() {
        let coordinatorMock = container.resolve(LoginCoordinating.self) as! MockLoginCoordinator

        viewModel.createAccount()
        coordinatorMock.createAccount()

        XCTAssertTrue(coordinatorMock.createAccountCalled)
        XCTAssertFalse(coordinatorMock.loginValidationCalled)
    }
}
