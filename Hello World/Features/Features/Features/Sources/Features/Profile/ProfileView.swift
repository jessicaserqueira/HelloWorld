//
//  File.swift
//  Features
//
//  Created by Jessica Serqueira on 05/06/23.
//

import SwiftUI

struct ProfileView: View {
    @ObservedObject var viewModel: ProfileViewModel
    @State private var isShowPhotoLibrary = false
    
    var body: some View {
        VStack {
            VStack(alignment: .center) {
                if let image = viewModel.image {
                    Image(uiImage: image)
                        .resizable()
                        .scaledToFill()
                        .frame(width: 130, height: 130)
                        .clipShape(Circle())
                        .overlay(Circle().stroke(Color.black, lineWidth: 4))
                        .shadow(radius: 7)
                }
            }
            .background(Color.white)
            .clipShape(Circle())
            .overlay(Circle().stroke(Color.black, lineWidth: 2))
            .shadow(radius: 8)
            .padding(6)
            .padding(.bottom, 32)
            
            VStack(alignment: .leading) {
                Text("Sobre mim")
                    .font(.headline)
                TextEditor(text: $viewModel.profile.bio)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .frame(height: 100)
                Text("Nome")
                    .font(.headline)
                TextField("Digite o nome", text: $viewModel.profile.name)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                Text("Email")
                    .font(.headline)
                TextField("Digite o email", text: $viewModel.profile.email)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
            }
            .padding()
            
            Button("Atualizar", action: viewModel.updateProfile)
                .padding()
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView(viewModel: ProfileViewModel(profile: Profile(name: "John Doe", email: "johndoe@example.com", bio: "")))
    }
}
