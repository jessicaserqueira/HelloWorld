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
                                .stroke(Color.blue, lineWidth: 4)
                        )
                    
                    VStack(spacing: 20) {
                        if let profile = viewModel.profile.first {
                            ZStack {
                                Circle()
                                    .foregroundColor(.blue)
                                    .frame(width: 130, height: 130)
                                
                                AsyncImage(url: URL(string: profile.profileUrl)) { image in
                                    image
                                        .resizable()
                                        .scaledToFill()
                                        .frame(width: 120, height: 120)
                                        .clipShape(Circle())
                                        .shadow(radius: 7)
                                } placeholder: {
                                    ProgressView()
                                        .frame(width: 50, height: 50)
                                }
                            }
                            .overlay(Circle().stroke(Color.white, lineWidth: 4))
                            
                            VStack(spacing: 10) {
                                Text(profile.name)
                                    .font(.title)
                                    .fontWeight(.bold)
                                    .foregroundColor(.blue)
                                
                                Text(profile.email)
                                    .font(.subheadline)
                                    .foregroundColor(.gray)
                                
                                Text("Sobre Mim")
                                    .font(.headline)
                                    .padding(.top, 20)
                                
                                TextEditor(text: profile.bio)
                                    .font(.body)
                                    .multilineTextAlignment(.center)
                                    .frame(maxWidth: 250, maxHeight: 100)
                                    .background(
                                        RoundedRectangle(cornerRadius: 10)
                                            .stroke(Color.blue, lineWidth: 1)
                                    )
                                    .padding()
                                
                                Button(action: {
                                    viewModel.saveBio()
                                }) {
                                    Text("Salvar")
                                        .foregroundColor(.white)
                                        .padding()
                                        .background(Color.blue)
                                        .cornerRadius(10)
                                }
                            }
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
