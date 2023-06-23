//
//  Location.swift
//  Domain
//
//  Created by Jessica Serqueira on 22/06/23.
//

import Foundation
import MapKit

public struct Location: Identifiable {
    public var id = UUID()
    public let name: String
    public let coordinate: CLLocationCoordinate2D
    
    public init(name: String, coordinate: CLLocationCoordinate2D) {
        self.id = UUID()
        self.name = name
        self.coordinate = coordinate
    }
}
