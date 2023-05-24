//
//  File.swift
//  Common
//
//  Created by Jessica Serqueira on 18/05/23.
//

import Foundation

public extension Array {

    func first<T>(typeOf: T.Type) -> T? {
        first(where: { $0 is T }) as? T
    }

    func last<T>(typeOf: T.Type) -> T? {
        last(where: { $0 is T }) as? T
    }

    func setupStyleForEach(_ styleClosure: (Element) -> Void) {
        forEach({ styleClosure($0) })
    }
}
