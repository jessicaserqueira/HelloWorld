//
//  CreateAccountCoordinator.swift
//  HelloWorld
//
//  Created by Jessica Serqueira on 15/05/23.
//

import Foundation
import UIKit
import Common
import SwiftUI


public class CreateAccountCoordinator: Coordinator {
    
    public var childCoordinators: [Coordinator] = []
    public var navigationController: UINavigationController
    private var coordinatorFactory: CoordinatorFactory
    
    public init(navigationController: UINavigationController, coordinatorFactory: CoordinatorFactory) {
        self.navigationController = navigationController
        self.coordinatorFactory = coordinatorFactory
    }
    
    public func start()  {
        let viewModel = CreateAccountViewModel(coordinator: self)
        let createAccountView = CreateAccountView(viewModel: viewModel)
        let hostingController = UIHostingController(rootView: createAccountView)
        navigationController.pushViewController(hostingController, animated: true)
    }
}

extension CreateAccountCoordinator: CreateAccountCoordinating {
    public func returnLoginView() {
        let coordinator = coordinatorFactory.makeLoginCoordinator()
        coordinator.start()
        childCoordinators.append(coordinator)
    }
    
    public func buttonCreateAccount() {
        let coordinator = coordinatorFactory.makeLoginCoordinator()
        coordinator.start()
        self.navigationController.popViewController(animated: true)
    }
    
    public func dismissModal() {
        DispatchQueue.main.asyncAfter(deadline: .now()) {
            let coordinator = self.coordinatorFactory.makeLoginCoordinator()
            coordinator.start()
            self.navigationController.popViewController(animated: true)
        }
    }
}
