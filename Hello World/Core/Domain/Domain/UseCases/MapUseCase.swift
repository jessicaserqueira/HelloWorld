//
//  MapUseCase.swift
//  Domain
//
//  Created by Jessica Serqueira on 23/06/23.
//

import Foundation

public class MapUseCase {
    private let mapRepository: MapRepository
    
    public init(mapRepository: MapRepository) {
        self.mapRepository = mapRepository
    }
}

extension MapUseCase: MapUseCaseProtocol {
    public func getLocation(address: String, delta: Double) {
        mapRepository.getLocation(address: address, delta: delta)
    }
}
