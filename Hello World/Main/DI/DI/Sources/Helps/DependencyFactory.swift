//
//  File.swift
//  
//
//  Created by NMAS Amaral on 23/12/22.
//

import Foundation
import Common
import Swinject

public protocol DependencyFactory: AnyObject {

    init(container: Resolver)
}
