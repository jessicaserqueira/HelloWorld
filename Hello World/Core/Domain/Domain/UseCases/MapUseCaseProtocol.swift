//
//  MapUseCaseProtocol.swift
//  Domain
//
//  Created by Jessica Serqueira on 23/06/23.
//

import Foundation

public protocol MapUseCaseProtocol {
    func getLocation(address: String, delta: Double)
}
