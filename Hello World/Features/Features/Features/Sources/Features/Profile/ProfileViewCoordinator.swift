//
//  File.swift
//  Features
//
//  Created by Jessica Serqueira on 05/06/23.
//

import SwiftUI
import Common

class ProfileCoordinator: Coordinator {
    
    var childCoordinators: [Common.Coordinator] = []
    public var navigationController: UINavigationController
    
    public init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let viewModel = ProfileViewModel(profile: Profile(name: "John Doe", email: "johndoe@example.com", bio: ""))
        let view = ProfileView(viewModel: viewModel)
        let hostingController = UIHostingController(rootView: view)
        navigationController.pushViewController(hostingController, animated: true)
    }
}
