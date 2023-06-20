//
//  File.swift
//  Domain
//
//  Created by Jessica Serqueira on 13/06/23.
//

import Foundation

public struct Profile: Hashable {
    let uuid: String
    let name: String
    let profileUrl: String
    
   public init(uuid: String, name: String, profileUrl: String) {
        self.uuid = uuid
        self.name = name
        self.profileUrl = profileUrl
    }
}
