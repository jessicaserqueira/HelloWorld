//
//  MapsAssembly.swift
//  DI
//
//  Created by Jessica Serqueira on 21/06/23.
//

import Swinject
import Common
import Features
import Domain
import SwiftUI

class MapsAssembly: Assembly {
    func assemble(container: Container) {
        let coordinator = container.resolveSafe(MapsCoordinator.self)
        container.register(MapsCoordinating.self) { _ in coordinator }
        
        // MARK: - MapsViewModel
        container.autoregister((any MapsModelling).self, initializer: MapsViewModel.init)
        container.register((any MapsModelling).self) { (resolver: Resolver) in
            return MapsViewModel(coordinator: resolver.resolveSafe(MapsCoordinating.self))
        }
    }
}
