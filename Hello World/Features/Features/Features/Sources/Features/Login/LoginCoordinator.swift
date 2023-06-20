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
    var tabBarController: UITabBarController
    var coordinatorFactory: CoordinatorFactory?
    var viewModelFactory: ViewModelFactory
    
    public init(navigationController: UINavigationController, tabBarController: UITabBarController, coordinatorFactory: CoordinatorFactory?, viewModelFactory: ViewModelFactory) {
        self.navigationController = navigationController
        self.tabBarController = tabBarController
        self.coordinatorFactory = coordinatorFactory
        self.viewModelFactory = viewModelFactory
    }
    
    public func start()  {
        showLoginView()
    }
    
    func showLoginView() {
        let viewModel = viewModelFactory.makeLoginViewModel()
        let loginView = LoginView(viewModel: viewModel)
        let hostingController = UIHostingController(rootView: loginView)
        navigationController.setViewControllers([hostingController], animated: false)
        tabBarController.tabBar.isHidden = false
    }
}

extension LoginCoordinator: LoginCoordinating {
    
    // MARK: -CreateAccount
    public func createAccount() {
        guard let coordinator = coordinatorFactory?.makeCreateAccountCoordinator()  else {  return }
        coordinator.start()

    }
    
    @MainActor public func loginValidation() {
        guard let coordinator = coordinatorFactory?.makeTabBarCoordinator() else {  return }
        coordinator.start()
    }
}
