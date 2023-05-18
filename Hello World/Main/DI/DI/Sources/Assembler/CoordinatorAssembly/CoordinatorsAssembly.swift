//
//  File.swift
//  HelloWorld
//
//  Created by Jessica Serqueira on 17/05/23.
//
import Common
import UIKit
import Features
import Swinject

class CoordinatorsAssembly: Assembly {
    
    public var window: UIWindow
    public var navigationController: UINavigationController
    
    public init(window: UIWindow, navigationController: UINavigationController) {
        self.window = window
        self.navigationController = navigationController
    }
    
    func assemble(container: Container) {
        
        let coordinatorFactory = container.resolve(CoordinatorFactory.self)
        
        container.register(AppCoordinator.self) { _ in AppCoordinator(window: self.window, coordinatorFactory: coordinatorFactory!, navigationController: self.navigationController) }
        let appCoordinator = container.resolve(AppCoordinator.self)
        
        // MARK: - LoginCoordinator
        container.register(LoginCoordinator.self) { _ in
            guard let navigationController = appCoordinator?.navigationController else {
                fatalError("AppCoordinator não foi inicializado corretamente")
            }
            return LoginCoordinator(navigationController: navigationController, coordinatorFactory: coordinatorFactory!)
        }
        
        // MARK: - CreateAccountCoordinator
        container.register(CreateAccountCoordinator.self) { _ in
            guard let navigationController = appCoordinator?.navigationController else {
                fatalError("AppCoordinator não foi inicializado corretamente")
            }
            return CreateAccountCoordinator(navigationController: navigationController, coordinatorFactory: coordinatorFactory!)
        }
    }
}
