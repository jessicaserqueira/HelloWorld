//
//  CreateAccountView.swift
//  HelloWorld
//
//  Created by Jessica Serqueira on 15/05/23.
//

import SwiftUI

struct CreateAccountView<ViewModel: CreateAccountModelling>: View {
    
    @ObservedObject var viewModel: ViewModel
    @State private var showModal = false
    @State private var isShowPhotoLibrary = false
    
    public init(viewModel: ViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        ZStack {
            Image("login")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                Text(L10n.CreateAccount.Label.title)
                    .font(Font.custom("Bangers-Regular", size: 50))
                    .foregroundColor(.primary)
                
                VStack(alignment: .center) {
                    Button {
                        isShowPhotoLibrary = true
                    } label: {
                        if viewModel.image.size.width > 0 {
                            Image(uiImage: viewModel.image)
                                .resizable()
                                .scaledToFill()
                                .frame(width: 130, height: 130)
                                .clipShape(Circle())
                                .overlay(Circle().stroke(Color.black, lineWidth: 4))
                                .shadow(radius: 7)
                        } else {
                            Text("Foto")
                                .frame(width: 130, height: 130)
                                .padding()
                                .foregroundColor(Color.black)
                                .cornerRadius(100.0)
                        }
                    }
                    .sheet(isPresented: $isShowPhotoLibrary) {
                        ImagePicker(selectedImage: $viewModel.image)
                    }
                }
                .background(Color.white)
                .clipShape(Circle())
                .overlay(Circle().stroke(Color.black, lineWidth: 2))
                .shadow(radius: 8)
                .padding(6)
                .padding(.bottom, 32)
                
                NameTextField(name: $viewModel.createAccount.name, borderColor: .black)
                    .padding()
                EmailTextField(email: $viewModel.createAccount.email, borderColor: .black)
                    .padding()
                PasswordTextField(password: $viewModel.createAccount.password, borderColor: .black)
                    .padding()
                
                Button(action: {
                    viewModel.returnLoginView()
                }) {
                    Text(L10n.CreateAccount.Ask.title)
                        .foregroundColor(.black)
                }
                .padding(.bottom, 32)
                
                VStack {
                    Button(action: {
                        viewModel.signUp()
                        self.showModal = true
                        DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
                            viewModel.dismissModal()
                            self.showModal = false
                        }
                    }) {
                        Text(L10n.CreateAccount.Button.title)
                            .foregroundColor(.white)
                            .bold()
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(
                                RoundedRectangle(cornerRadius: 10)
                                    .fill(Color.black)
                            )
                            .padding(.horizontal)
                            .padding(.bottom, 30)
                    }
                    .disabled(viewModel.isButtonDisabled)
                    .foregroundColor(.gray)
                    .opacity(viewModel.isButtonDisabled ? 0.5 : 1.0)
                    .alert(isPresented: $viewModel.formInvalid) {
                        Alert(title: Text(viewModel.alertText))
                    }
                }
            }
            .navigationBarBackButtonHidden(true)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .padding(.horizontal, 32)
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}
