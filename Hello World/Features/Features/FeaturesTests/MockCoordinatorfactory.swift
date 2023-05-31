//
//  MockCoordinatorfactory.swift
//  FeaturesTests
//
//  Created by Jessica Serqueira on 30/05/23.
//

import XCTest
import Common
@testable import Features

class CoordinatorFactoryMock: CoordinatorFactory {
    required init(container: Swinject.Resolver) {
        <#code#>
    }
    
    func makeLoginCoordinator() -> LoginCoordinator {
        return MockLoginCoordinator()
    }
    
    func makeCreateAccountCoordinator() -> CreateAccountCoordinator {
        return MockLoginCoordinator()
    }
}
