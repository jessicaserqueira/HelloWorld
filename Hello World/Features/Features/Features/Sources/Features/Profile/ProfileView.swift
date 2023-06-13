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
        ZStack {
            Color(red: 215/255, green: 229/255, blue: 242/255)                 .edgesIgnoringSafeArea(.all)
            VStack {
                Spacer()
                
                ZStack {
                    RoundedRectangle(cornerRadius: 16)
                        .foregroundColor(.white)
                        .frame(width: 300, height: 400)
                        .overlay(
                            RoundedRectangle(cornerRadius: 16)
                                .stroke(Color.white, lineWidth: 4)
                        )
                    
                    VStack {
                        if let image = viewModel.image {
                            Image(uiImage: image)
                                .resizable()
                                .scaledToFill()
                                .frame(width: 130, height: 130)
                                .clipShape(Circle())
                                .overlay(Circle().stroke(Color.white, lineWidth: 4))
                                .shadow(radius: 7)
                                .offset(y: -65)
                        }
                        VStack {
                            Text("")
                                .textFieldStyle(RoundedBorderTextFieldStyle())
                            Text("")
                                .textFieldStyle(RoundedBorderTextFieldStyle())
                                .padding()
                            
                            Text("Sobre mim")
                                .font(.headline)
                                .padding(.top, 20)
                            VStack {
                                Text(" $viewModel.profile.bio")
                                    .textFieldStyle(RoundedBorderTextFieldStyle())
                                    .frame(height: 80)
                                    .padding()
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 8)
                                            .stroke(Color(red: 240/255, green: 240/255, blue: 240/255), lineWidth: 2)
                                    )
                            }
                            .frame(width: 250)
                            
                        }
                        .padding(.bottom, 20)
                    }
                }
                .padding()
                
                Spacer()
                
                Button("Atualizar", action: viewModel.updateProfile)
                    .padding()
                    .foregroundColor(.white)
                    .background(Color.blue)
                    .cornerRadius(10)
            }
            .padding()
        }
        .navigationBarTitle("Perfil")
    }
}
