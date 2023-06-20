//
//  File.swift
//  Features
//
//  Created by Jessica Serqueira on 05/06/23.
//


import SwiftUI
import Common

public class ProfileCoordinator: Coordinator {
    
    public var childCoordinators: [Common.Coordinator] = []
    public var navigationController = UINavigationController()
    public var tabBarController: UITabBarController
    private var coordinatorFactory: CoordinatorFactory
    var viewModelFactory: ViewModelFactory
    
    public init(tabBarController: UITabBarController, coordinatorFactory: CoordinatorFactory, viewModelFactory: ViewModelFactory) {
        self.tabBarController = tabBarController
        self.coordinatorFactory = coordinatorFactory
        self.viewModelFactory = viewModelFactory
    }
    
    public func start() {
        showProfile()
    }
}

extension ProfileCoordinator: ProfileCoordinating {
    public func showProfile() {
        let viewModel = viewModelFactory.makeProfileViewModel()
        let view = ProfileView(viewModel: viewModel)
        let hostingController = UIHostingController(rootView: view)
        navigationController.pushViewController(hostingController, animated: true)
    }
}
