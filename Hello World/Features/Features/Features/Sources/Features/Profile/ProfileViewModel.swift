//
//  File.swift
//  Features
//
//  Created by Jessica Serqueira on 05/06/23.
//

import SwiftUI

class ProfileViewModel: ObservableObject {
    @Published public var image = UIImage()
    @Published var profile: Profile
    
    init(profile: Profile) {
        self.profile = profile
    }
    
    func updateProfile() {
        // Lógica para atualizar o perfil de usuário
    }
}
