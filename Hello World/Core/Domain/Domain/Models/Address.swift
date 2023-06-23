//
//  Address.swift
//  Domain
//
//  Created by Jessica Serqueira on 22/06/23.
//

import Foundation

public struct Address: Codable {
    public let data: [Datum]
    
    public init(data: [Datum]) {
        self.data = data
    }
}
