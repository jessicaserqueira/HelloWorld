//
//  File.swift
//  HelloWorld
//
//  Created by Jessica Serqueira on 17/05/23.
//

import Features
import Common
import Swinject
import SwinjectAutoregistration
import UIKit

public class DependencyInjector {

    private var window: UIWindow
    private var navigationController: UINavigationController
    
    public init(window: UIWindow, navigationController: UINavigationController) {
        self.window = window
        self.navigationController = navigationController
    }
    
    public func build(completion: (_ appCoordinator: AppCoordinator) -> Void) {
        
        let assembler = Assembler([
            CoordinatorsFactoryAssembly(),

            FireStorageAssembly(),
            DataAssembly(),
            DomainAssembly(),
            
            CoordinatorsAssembly(window: window, navigationController: navigationController),
            LoginAssembly(),

        ])
        
        let appCoordinator = assembler.resolver.resolveSafe(AppCoordinator.self)
        completion(appCoordinator)
    }
}
