//
//  Data.swift
//  Domain
//
//  Created by Jessica Serqueira on 22/06/23.
//

import Foundation

public struct Datum: Codable {
    public let latitude, longitude: Double
    public let name: String?
    
    public init(latitude: Double, longitude: Double, name: String?) {
        self.latitude = latitude
        self.longitude = longitude
        self.name = name
    }
}
