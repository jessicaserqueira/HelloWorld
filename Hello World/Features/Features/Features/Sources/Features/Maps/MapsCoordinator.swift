//
//  MapsCoordinator.swift
//  Features
//
//  Created by Jessica Serqueira on 21/06/23.
//

import SwiftUI
import Common

public class MapsCoordinator: Coordinator {
    
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
        showMaps()
    }
}

extension MapsCoordinator: MapsCoordinating {
    public func showMaps() {
        let viewModel = viewModelFactory.makeMapsViewModel()
        let view = MapsView(viewModel: viewModel)
        let hostingController = UIHostingController(rootView: view)
        navigationController.pushViewController(hostingController, animated: true)
    }
}
