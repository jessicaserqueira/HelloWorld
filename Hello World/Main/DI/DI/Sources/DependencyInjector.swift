//
//  File.swift
//  HelloWorld
//
//  Created by Jessica Serqueira on 17/05/23.
//

import UIKit
import Common
import Features
import Swinject
import SwinjectAutoregistration

public class DependencyInjector {

    public var window: UIWindow
    let navigationController: UINavigationController
    
    public init(window: UIWindow, navigationController: UINavigationController) {
        self.window = window
        self.navigationController = navigationController
    }
    
    public func build(completion: (_ appCoordinator: AppCoordinator) -> Void) {
        
        let assembler = Assembler([
            CoordinatorsFactory(),
            ViewsFactory(),
            
            FireStorageAssembly(),
            DomainAssembly(),
            DataAssembly(),
            
            CoordinatorsAssembly(window: window, navigationController: navigationController),
            LoginAssembly(),
            CreateAccountAssembly(),
            ProfileAssembly(),
            MapsAssembly(),

        ])
        
        let appCoordinator = assembler.resolver.resolveSafe(AppCoordinator.self)
        completion(appCoordinator)
    }
}
