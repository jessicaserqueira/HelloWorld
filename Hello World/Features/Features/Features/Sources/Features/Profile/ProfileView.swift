//
//  File.swift
//  Features
//
//  Created by Jessica Serqueira on 05/06/23.
//
import SwiftUI
import Domain

struct ProfileView: View {
    @ObservedObject var viewModel: ProfileViewModel
    @State private var isShowPhotoLibrary = false
    
    var body: some View {
        ZStack {
            Color(red: 215/255, green: 229/255, blue: 242/255)
                .edgesIgnoringSafeArea(.all)
            
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
                        if let profile = viewModel.profile.first {
                            AsyncImage(url: URL(string: profile.profileUrl)) { image in
                                image.resizable()
                                    .scaledToFit()
                            } placeholder: {
                                ProgressView()
                                    .frame(width: 50, height: 50)
                                    .scaledToFill()
                                    .frame(width: 130, height: 130)
                                    .clipShape(Circle())
                                    .overlay(Circle().stroke(Color.white, lineWidth: 4))
                                    .shadow(radius: 7)
                                    .offset(y: -65)
                            }
                            
                            VStack {
                                Text(profile.name)
                                    .textFieldStyle(RoundedBorderTextFieldStyle())
                                Text(profile.email)
                                    .textFieldStyle(RoundedBorderTextFieldStyle())
                                    .padding()
                                
                                Text("Sobre mim")
                                    .font(.headline)
                                    .padding(.top, 20)
                                
                                VStack {
                                    Text(profile.bio)
                                        .textFieldStyle(RoundedBorderTextFieldStyle())
                                        .frame(height: 80)
                                        .padding()
                                        .overlay(
                                            RoundedRectangle(cornerRadius: 10)
                                                .stroke(Color.blue, lineWidth: 1)
                                        )
                                    
                                    Button(action: {
                                        isShowPhotoLibrary.toggle()
                                    }) {
                                        Text("Escolher foto")
                                            .font(.headline)
                                            .foregroundColor(.white)
                                            .padding()
                                            .frame(width: 250, height: 50)
                                            .background(Color.blue)
                                            .cornerRadius(10)
                                    }
                                    .sheet(isPresented: $isShowPhotoLibrary) {
                                        // Implementação da seleção da foto da biblioteca
                                    }
                                }
                            }
                            .padding()
                        } else {
                            Text("Perfil não encontrado")
                                .font(.headline)
                                .foregroundColor(.red)
                                .padding()
                        }
                    }
                }
                
                Spacer()
            }
        }
        .onAppear {
            viewModel.updateProfile()
            
        }
    }
}
