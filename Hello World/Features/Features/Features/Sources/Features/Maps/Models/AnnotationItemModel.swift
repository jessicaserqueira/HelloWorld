//
//  AnnotationItemModel.swift
//  Features
//
//  Created by Jessica Serqueira on 21/06/23.
//

import Foundation
import CoreLocation

public struct AnnotationItemModel: Identifiable {
    public let id = UUID()
    public let title: String
    public let coordinate: CLLocationCoordinate2D
}
