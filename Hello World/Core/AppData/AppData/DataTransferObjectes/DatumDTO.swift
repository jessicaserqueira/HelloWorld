//
//  DatumDTO.swift
//  AppData
//
//  Created by Jessica Serqueira on 22/06/23.
//

import Foundation
import Domain

public struct DatumDTO: Codable {
    public let latitude, longitude: Double
    public  let name: String?
    
    public init(latitude: Double, longitude: Double, name: String?) {
        self.latitude = latitude
        self.longitude = longitude
        self.name = name
    }
}

extension DatumDTO {
    public var toDomain: Datum {
        .init(
            latitude: latitude,
            longitude: longitude,
            name: name
        )
    }
}
