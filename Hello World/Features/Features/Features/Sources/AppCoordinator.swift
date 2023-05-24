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
    public var childCoordinators: [Coordinator] = []
    public var coordinatorFactory: CoordinatorFactory?
    public var viewModelFactory: ViewModelFactory?
    
    public init(window: UIWindow, coordinatorFactory: CoordinatorFactory?, viewModelFactory: ViewModelFactory?, navigationController: UINavigationController) {
        self.window = window
        self.coordinatorFactory = coordinatorFactory
        self.viewModelFactory = viewModelFactory
        self.navigationController = navigationController
    }
    
    public func start() {
        window.rootViewController = self.navigationController
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
}
