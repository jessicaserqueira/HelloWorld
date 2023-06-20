//
//  CreateAccountTests.swift
//  FeaturesTests
//
//  Created by Jessica Serqueira on 31/05/23.
//

import XCTest
import Common
import Domain
import Swinject
import SwinjectAutoregistration
@testable import Features

final class CreateAccountTests: XCTestCase {
    
    private var container: Container!
    private var viewModel: CreateAccountViewModel!
    
    override func setUp() {
        super.setUp()
        container = Container()
        container.autoregister(CreateAccountUseCaseProtocol.self, initializer: MockCreateAccountUseCase.init)
        container.autoregister(CreateAccountCoordinating.self, initializer: MockCreateAccountCoordinator.init)
        viewModel = CreateAccountViewModel(
            coordinator: container.resolve(CreateAccountCoordinating.self),
            createAccountUseCase: container.resolve(CreateAccountUseCaseProtocol.self)!
        )
    }
    
    override func tearDown() {
        viewModel = nil
        container = nil
        super.tearDown()
    }
    
    func testButtonDisabled() {
        XCTAssertTrue(viewModel.isButtonDisabled)
        
        viewModel.createAccount.name = "John Doe"
        XCTAssertTrue(viewModel.isButtonDisabled)
        
        viewModel.createAccount.email = "john.doe@example.com"
        XCTAssertTrue(viewModel.isButtonDisabled)
        
        viewModel.createAccount.password = "password123"
        XCTAssertTrue(viewModel.isButtonDisabled)
        
        print("Image width before assignment: \(viewModel.image.size.width)")
        viewModel.image = UIImage()
        print("Image width after assignment: \(viewModel.image.size.width)")
        XCTAssertTrue(viewModel.isButtonDisabled)
    }
    
    func testReturnLoginView() {
        let coordinator = container.resolve(CreateAccountCoordinating.self)
        viewModel.returnLoginView()
        coordinator?.returnLoginView()
    }
    
    func testDismissModal() {
        let coordinator = container.resolve(CreateAccountCoordinating.self)
        viewModel.dismissModal()
        coordinator?.dismissModal()
    }
    
    func testButtonCreateAccount() {
        let useCase = container.resolve(CreateAccountUseCaseProtocol.self)
        viewModel.createAccount.name = "John Doe"
        viewModel.createAccount.email = "john.doe@example.com"
        viewModel.createAccount.password = "password123"
        viewModel.image = UIImage()
        
        viewModel.signUp()
        useCase?.signUp(withEmail: viewModel.createAccount.email, password: viewModel.createAccount.password, image: viewModel.image , name: viewModel.createAccount.name)  { err in
            if let err = err {
                print(err)
            }
            XCTAssertFalse(self.viewModel.isLoading)
        }
    }
    
    func testButtonCreateAccountInvalidImage() {
        let useCase = container.resolve(CreateAccountUseCaseProtocol.self)
        
        viewModel.createAccount.name = "John Doe"
        viewModel.createAccount.email = "john.doe@example.com"
        viewModel.createAccount.password = "password123"
        
        viewModel.signUp()
        
        XCTAssertTrue(viewModel.formInvalid)
        XCTAssertEqual(viewModel.alertText, "Selecione uma foto")
    }
    
    func testButtonCreateAccountError() {
        let useCase = container.resolve(CreateAccountUseCaseProtocol.self)
        
        viewModel.createAccount.name = "John Doe"
        viewModel.createAccount.email = "john.doe@example.com"
        viewModel.createAccount.password = "password123"
        viewModel.image = UIImage()
        
 
        viewModel.signUp()
        
        XCTAssertEqual(self.viewModel.alertText, "Selecione uma foto")
        XCTAssertTrue(self.viewModel.formInvalid)
        
        useCase?.signUp(withEmail: viewModel.createAccount.email, password: viewModel.createAccount.password, image: viewModel.image , name: viewModel.createAccount.name)  { err in
            if let err = err {
                print(err)
            }
            XCTAssertTrue(self.viewModel.formInvalid)
        }
        
        func testButtonCreateAccount_Loading() {
            let useCase = container.resolve(CreateAccountUseCaseProtocol.self) as! MockCreateAccountUseCase
            
            viewModel.createAccount.name = "John Doe"
            viewModel.createAccount.email = "john.doe@example.com"
            viewModel.createAccount.password = "password123"
            viewModel.image = UIImage()
            
            viewModel.signUp()
            useCase.signUp(withEmail: viewModel.createAccount.email, password: viewModel.createAccount.password, image: viewModel.image , name: viewModel.createAccount.name)  { err in
                if let err = err {
                    print(err)
                }
            }
            XCTAssertFalse(viewModel.isLoading)
            useCase.signUpCompletion?(nil)
            XCTAssertFalse(viewModel.isLoading)
        }
    }
}
