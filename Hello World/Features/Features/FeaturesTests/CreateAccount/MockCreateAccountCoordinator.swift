//
//  MockCreateAccountCoordinator.swift
//  FeaturesTests
//
//  Created by Jessica Serqueira on 31/05/23.
//

import XCTest
import Common
@testable import Features

final class MockCreateAccountCoordinator: CreateAccountCoordinating {
    var returnLoginViewCalled = false
    var dismissModalCalled = false
    
    func returnLoginView() {
        returnLoginViewCalled = true
    }
    
    func dismissModal() {
        dismissModalCalled = true
    }
}
