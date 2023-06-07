//
//  File.swift
//  HelloWorld
//
//  Created by Jessica Serqueira on 17/05/23.
//

import UIKit
import Common
import Domain

public class AppCoordinator: Common.Coordinator {
    
    public var window: UIWindow
    public var navigationController: UINavigationController
    public var tabBarController: UITabBarController
    public var childCoordinators: [Coordinator] = []
    public var coordinatorFactory: CoordinatorFactory?
    public var viewModelFactory: ViewModelFactory?
    
    public init(window: UIWindow, coordinatorFactory: CoordinatorFactory?, viewModelFactory: ViewModelFactory?, navigationController: UINavigationController) {
        self.window = window
        self.coordinatorFactory = coordinatorFactory
        self.viewModelFactory = viewModelFactory
        self.navigationController = navigationController
        self.tabBarController = UITabBarController()
    }
    
    public func start() {
        navigationController.setViewControllers([tabBarController], animated: false)
        window.rootViewController = navigationController
        window.makeKeyAndVisible()
        showLogin()
    }
}

extension AppCoordinator {
    
    func showLogin() {
        guard let loginCoordinator = self.coordinatorFactory?.makeLoginCoordinator() else { return }
        loginCoordinator.start()
        self.childCoordinators.append(loginCoordinator)
    }
    
    @MainActor func loginPersistenceValidation() {
        guard let coordinator = coordinatorFactory?.makeTabBarCoordinator() else { return }
        coordinator.start()
        self.childCoordinators.append(coordinator)
        navigationController.setViewControllers([coordinator.tabBarViewController], animated: true)
    }
}
