//
//  CoordinatorFactory.swift
//  HelloWorld
//
//  Created by Jessica Serqueira on 15/05/23.
//

import Foundation

public protocol CoordinatorFactory: DependencyFactory {
    
    func makeLoginCoordinator() -> LoginCoordinator
    func makeCreateAccountCoordinator() -> CreateAccountCoordinator
}
