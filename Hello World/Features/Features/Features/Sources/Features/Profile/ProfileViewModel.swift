//
//  File.swift
//  Features
//
//  Created by Jessica Serqueira on 05/06/23.
//

import SwiftUI

public class ProfileViewModel: ObservableObject {
    
    private var coordinator: ProfileCoordinating?
    @Published public var image = UIImage()
    @Published var profile = Profile(name: "", email: "", bio: "")
    
    public init(coordinator: ProfileCoordinating?) {
        self.coordinator = coordinator
    }
}

extension ProfileViewModel: ProfileModelling {
    public func updateProfile() {
    }
}
