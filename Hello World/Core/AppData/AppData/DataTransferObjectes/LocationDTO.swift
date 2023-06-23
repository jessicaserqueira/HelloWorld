//
//  LocationDTO.swift
//  AppData
//
//  Created by Jessica Serqueira on 22/06/23.
//

import Foundation
import Domain
import MapKit

public struct LocationDTO: Identifiable {
    public var id = UUID()
    public let name: String
    public let coordinate: CLLocationCoordinate2D
    
    public init(name: String, coordinate: CLLocationCoordinate2D) {
        self.id = UUID()
        self.name = name
        self.coordinate = coordinate
    }
}

extension LocationDTO {
    public var toDomain: Location {
        .init(
            name: name,
            coordinate: coordinate
        )
    }
}
