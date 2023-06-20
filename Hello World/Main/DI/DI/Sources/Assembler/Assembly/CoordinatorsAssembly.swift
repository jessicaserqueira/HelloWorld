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
    let navigationController: UINavigationController
    
    public init(window: UIWindow, navigationController: UINavigationController) {
        self.window = window
        self.navigationController = navigationController
    }
    
    func assemble(container: Container) {
        
        let coordinatorFactory = container.resolveSafe(CoordinatorFactory.self)
        let viewModelFactory = container.resolveSafe(ViewModelFactory.self)
        
        container.register(AppCoordinator.self) { _ in  AppCoordinator(window: self.window, coordinatorFactory: coordinatorFactory, viewModelFactory: viewModelFactory, navigationController: self.navigationController) }
        let appCoordinator = container.resolve(AppCoordinator.self)
        
        
        // MARK: - LoginCoordinator
        container.register(LoginCoordinator.self) { _ in
            guard let navigationController = appCoordinator?.navigationController,
                  let tabBarController = appCoordinator?.tabBarController else {
                fatalError("AppCoordinator não foi inicializado corretamente")
            }
            return LoginCoordinator(navigationController: navigationController, tabBarController: tabBarController, coordinatorFactory: coordinatorFactory, viewModelFactory: viewModelFactory)
        }
        
        
        // MARK: - CreateAccountCoordinator
        container.register(CreateAccountCoordinator.self) { _ in
            let coordinator = CreateAccountCoordinator(navigationController: self.navigationController,
                                                       coordinatorFactory: coordinatorFactory,
                                                       viewModelFactory: viewModelFactory)
            return coordinator
        }
        _ = container.resolveSafe(CreateAccountCoordinator.self)
        
        // MARK: - tabBarCoordinator
        container.register(TabBarCoordinator.self) { _ in
            guard let navigationController = appCoordinator?.navigationController,
                  let tabBarController = appCoordinator?.tabBarController else {
                fatalError("AppCoordinator não foi inicializado corretamente")
            }
            return TabBarCoordinator(navigationController: navigationController, tabBarViewController: tabBarController, coordinatorfactory:  coordinatorFactory)
        }
        
        // MARK: - CreateAccountCoordinator
        container.register(ProfileCoordinator.self) { _ in
            guard let tabBarController = appCoordinator?.tabBarController else {
                fatalError("AppCoordinator não foi inicializado corretamente")
            }
            return ProfileCoordinator(tabBarController: tabBarController, coordinatorFactory: coordinatorFactory, viewModelFactory: viewModelFactory)
        }
    }
}
