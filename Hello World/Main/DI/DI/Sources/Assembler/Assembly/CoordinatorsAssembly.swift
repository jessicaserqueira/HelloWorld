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
    
    public init(window: UIWindow) {
        self.window = window
    }
    
    func assemble(container: Container) {
        assembleAppCoordinator(container: container)
        assembleLoginCoordinator(container: container)
        assembleCreateAccountCoordinator(container: container)
    }
    
    func assembleAppCoordinator(container: Container) {
        let navigationController = UINavigationController()
        let coordinatorFactory = container.resolveSafe(CoordinatorFactory.self)
        let viewModelFactory = container.resolveSafe(ViewModelFactory.self)
        let appCoordinator = AppCoordinator(window: window, coordinatorFactory: coordinatorFactory, viewModelFactory: viewModelFactory, navigationController: navigationController)
        container.register(AppCoordinator.self) { _ in appCoordinator }
        
    }
    
    // MARK: - LoginCoordinator
    func assembleLoginCoordinator(container: Container) {
        let appCoordinator = container.resolveSafe(AppCoordinator.self)
        let viewModelFactory = container.resolveSafe(ViewModelFactory.self)
        let coordinatorFactory = container.resolve(CoordinatorFactory.self)
        container.register(LoginCoordinator.self) { _ in
            let loginCoordinator = LoginCoordinator(navigationController: appCoordinator.navigationController,
                                                    coordinatorFactory: coordinatorFactory,
                                                    viewModelFactory: viewModelFactory)
            return loginCoordinator
        }
        
        _ = container.resolveSafe(LoginCoordinator.self)
    }
    
    
    // MARK: - CreateAccountCoordinator
    func assembleCreateAccountCoordinator(container: Container) {
        let appCoordinator = container.resolveSafe(AppCoordinator.self)
        let viewModelFactory = container.resolveSafe(ViewModelFactory.self)
        let coordinatorFactory = container.resolve(CoordinatorFactory.self)
        container.register(CreateAccountCoordinator.self) { _ in
            let coordinator = CreateAccountCoordinator(navigationController: appCoordinator.navigationController,
                                                       coordinatorFactory: coordinatorFactory,
                                                       viewModelFactory: viewModelFactory)
            return coordinator
        }
        _ = container.resolveSafe(CreateAccountCoordinator.self)
    }
}
