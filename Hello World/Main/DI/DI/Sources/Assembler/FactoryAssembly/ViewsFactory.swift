//
//  File.swift
//  Features
//
//  Created by Jessica Serqueira on 22/05/23.
//
import Features
import Swinject

class ViewsFactory: Assembly {
    
    func assemble(container: Container) {
        container.register(ViewModelFactory.self) { resolver in
            return ViewsFactoryImplementation(container: resolver)
            
        }
    }
}
