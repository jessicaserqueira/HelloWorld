//
//  AddressDTO.swift
//  AppData
//
//  Created by Jessica Serqueira on 22/06/23.
//

import Foundation
import Domain

public struct AddressDTO: Codable {
    public let data: [DatumDTO]
    
    public init(data: [DatumDTO]) {
        self.data = data
    }
}

extension AddressDTO {
    public var toDomain: Address {
        .init(data: data.map {$0.toDomain})
    }
}
