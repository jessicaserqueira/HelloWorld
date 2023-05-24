//
//  File.swift
//  HelloWorld
//
//  Created by Jessica Serqueira on 17/05/23.
//

import Features
import Swinject

class CoordinatorsFactory: Assembly {
    
    func assemble(container: Container) {
        container.register(CoordinatorFactory.self) { resolver in
            return CoordinatorFactoryImplementation(container: resolver)
            
        }
    }
    
}
