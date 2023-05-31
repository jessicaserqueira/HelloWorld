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
    var viewModelFactory: ViewModelFactory
    
    public init(navigationController: UINavigationController, coordinatorFactory: CoordinatorFactory?, viewModelFactory: ViewModelFactory) {
        self.navigationController = navigationController
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
        navigationController.tabBarController?.tabBar.isHidden = false
    }
    public func makeLoginView(viewModel: LoginViewModel) -> AnyView {
        let loginView = LoginView(viewModel: viewModel)
        return AnyView(loginView)
    }
}

extension LoginCoordinator: LoginCoordinating {
    
    // MARK: -CreateAccount
    public func createAccount() {
        guard let coordinator = coordinatorFactory?.makeCreateAccountCoordinator()  else {  return }
        coordinator.start()
        childCoordinators.append(coordinator)
    }
    
    public func loginValidation() {
        guard let coordinator = coordinatorFactory?.makeLoginCoordinator() else {  return }
        coordinator.start()
        childCoordinators.append(coordinator)
    }
}
