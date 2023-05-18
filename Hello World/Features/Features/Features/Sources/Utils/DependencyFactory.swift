//
//  File.swift
//  HelloWorld
//
//  Created by Jessica Serqueira on 15/05/23.
//

import Swinject

public protocol DependencyFactory: AnyObject {

    init(container: Resolver)
}
