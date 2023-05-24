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

    private var window: UIWindow

    
    public init(window: UIWindow) {
        self.window = window
    }
    
    public func build(completion: (_ appCoordinator: AppCoordinator) -> Void) {
        
        let assembler = Assembler([
            CoordinatorsFactory(),
            ViewsFactory(),
            
            FireStorageAssembly(),
            DomainAssembly(),
            DataAssembly(),
            
            CoordinatorsAssembly(window: window),
            LoginAssembly(),
            CreateAccountAssembly(),

        ])
        
        let appCoordinator = assembler.resolver.resolveSafe(AppCoordinator.self)
        completion(appCoordinator)
    }
}
