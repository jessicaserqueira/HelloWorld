//
//  MapDataSouce.swift
//  Networking
//
//  Created by Jessica Serqueira on 23/06/23.
//

import Foundation
import AppData

public class MapRemoteDataSouce {
    
    let mapAPIService: MapAPIService
    
    public init(mapAPIService: MapAPIService) {
        self.mapAPIService = mapAPIService
    }
}

extension MapRemoteDataSouce: AppData.MapRemoteDataSource {
    public func getLocation(address: String, delta: Double) {
        mapAPIService.getLocation(address: address, delta: delta)
    }
}
