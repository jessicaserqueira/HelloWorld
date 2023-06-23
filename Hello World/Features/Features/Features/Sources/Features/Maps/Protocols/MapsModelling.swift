//
//  MapsModelling.swift
//  Features
//
//  Created by Jessica Serqueira on 21/06/23.
//

import SwiftUI
import CoreLocation

public protocol MapsModelling {
    func addAnnotation(coordinate: CLLocationCoordinate2D)
}
