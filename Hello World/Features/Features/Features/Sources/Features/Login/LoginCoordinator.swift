//
//  LoginCoordinator.swift
//  HelloWorld
//
//  Created by Jessica Serqueira on 15/05/23.
//

import Foundation
import Common
import SwiftUI
import Domain

public class LoginCoordinator: Coordinator {
    
    public var childCoordinators: [Coordinator] = []
    public var navigationController: UINavigationController
    var coordinatorFactory: CoordinatorFactory?
    
    public init(navigationController: UINavigationController, coordinatorFactory: CoordinatorFactory?) {
        self.navigationController = navigationController
        self.coordinatorFactory = coordinatorFactory
    }
    
    public func start()  {
        let viewModel = LoginViewModel(coordinator: self)
        let loginView = LoginView(viewModel: viewModel)
        let hostingController = UIHostingController(rootView: loginView)
        navigationController.setViewControllers([hostingController], animated: false)
        navigationController.tabBarController?.tabBar.isHidden = false
    }
}

extension LoginCoordinator: LoginCoordinating {
    
    // MARK: -CreateAccount
    public func createAccount() {
        guard let coordinator = coordinatorFactory?.makeCreateAccountCoordinator()  else {  return }
        coordinator.start()
        childCoordinators.append(coordinator)
    }
    
    public func loginValidation(email: String, password: String) {
        guard let coordinator = coordinatorFactory?.makeLoginCoordinator() else {  return }
        coordinator.start()
        childCoordinators.append(coordinator)
    }
}
