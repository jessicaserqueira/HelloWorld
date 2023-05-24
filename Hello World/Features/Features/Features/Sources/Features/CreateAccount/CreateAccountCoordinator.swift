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
    private var coordinatorFactory: CoordinatorFactory?
    var viewModelFactory: ViewModelFactory
    
    public init(navigationController: UINavigationController, coordinatorFactory: CoordinatorFactory?, viewModelFactory: ViewModelFactory) {
        self.navigationController = navigationController
        self.coordinatorFactory = coordinatorFactory
        self.viewModelFactory = viewModelFactory
    }
    
    public func start()  {
        let viewModel = viewModelFactory.makeCreateAccountViewModel()
        let createAccountView = CreateAccountView(viewModel: viewModel)
        let hostingController = UIHostingController(rootView: createAccountView)
        navigationController.pushViewController(hostingController, animated: true)
    }
}

extension CreateAccountCoordinator: CreateAccountCoordinating {
    public func returnLoginView() {
        guard let coordinator = coordinatorFactory?.makeLoginCoordinator() else {  return }
        coordinator.start()
        childCoordinators.append(coordinator)
    }
    
    public func buttonCreateAccount() {
        guard let coordinator = coordinatorFactory?.makeLoginCoordinator() else { return }
        coordinator.start()
        self.navigationController.popViewController(animated: true)
    }
    
    public func dismissModal() {
        DispatchQueue.main.asyncAfter(deadline: .now()) {
            guard let coordinator = self.coordinatorFactory?.makeLoginCoordinator() else { return }
            coordinator.start()
            self.navigationController.popViewController(animated: true)
        }
    }
}
