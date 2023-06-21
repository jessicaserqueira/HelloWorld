//
//  TabbarCoordinator.swift
//  Features
//
//  Created by Jessica Serqueira on 06/06/23.
//

import Common
import UIKit
import SwiftUI

public class TabBarCoordinator: Coordinator {
    
    var navigationController: UINavigationController
    var tabBarViewController: UITabBarController
    public var childCoordinators: [Coordinator]
    var coordinatorfactory: CoordinatorFactory
    
    public init(navigationController: UINavigationController, tabBarViewController: UITabBarController, coordinatorfactory: CoordinatorFactory) {
        self.navigationController = navigationController
        self.tabBarViewController = tabBarViewController
        self.coordinatorfactory = coordinatorfactory
        self.childCoordinators = []
    }
    
    @MainActor public func start() {
        let profileCoordinator = makeProfileCoordinator()
        let mapsCoordinator = makeMapsCoordinator()
        
        childCoordinators = [profileCoordinator, mapsCoordinator]
        tabBarViewController.setViewControllers(
            [
                profileCoordinator.navigationController,
                mapsCoordinator.navigationController
            ],
            animated: false
        )
        navigationController.setViewControllers([tabBarViewController], animated: false)
        
    }
    
    
    private func makeProfileCoordinator() -> ProfileCoordinator {
        let coordiantor = coordinatorfactory.makeProfileCoordinator()
        coordiantor.start()
        coordiantor.navigationController.tabBarItem = UITabBarItem(title: L10n.Profile.Title.title,
                                                                   image: UIImage(systemName: "person.fill"),
                                                                   selectedImage: UIImage(systemName: "person.fill"))
        return coordiantor
    }
    
    private func makeMapsCoordinator() -> MapsCoordinator {
        let coordinator = coordinatorfactory.makeMapsCoordinator()
        coordinator.start()
        coordinator.navigationController.tabBarItem = UITabBarItem(title: L10n.Maps.Title.title,
                                                                   image: UIImage(systemName: "map.fill"),
                                                                   selectedImage: UIImage(systemName: "map.fill"))
        return coordinator
    }
}
