//
//  MapRepository.swift
//  AppData
//
//  Created by Jessica Serqueira on 23/06/23.
//

import Foundation
import Domain

public struct MapRepository {
    private let remote: MapRemoteDataSource
    
    public init(remote: MapRemoteDataSource) {
        self.remote = remote
    }
}

extension MapRepository: Domain.MapRepository {
    public func getLocation(address: String, delta: Double) {
        remote.getLocation(address: address, delta: delta)
    }
}
