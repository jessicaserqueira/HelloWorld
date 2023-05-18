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
    
    public init(window: UIWindow, coordinatorFactory: CoordinatorFactory?, navigationController: UINavigationController) {
        self.window = window
        self.coordinatorFactory = coordinatorFactory
        self.navigationController = navigationController
    }
    
    public func start() {
        window.rootViewController = self.navigationController
        window.makeKeyAndVisible()
        guard let loginCoordinator = coordinatorFactory?.makeLoginCoordinator() else {return}
        loginCoordinator.start()
        childCoordinators.append(loginCoordinator)
    }
}
