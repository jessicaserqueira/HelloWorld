//
//  CreateAccountView.swift
//  HelloWorld
//
//  Created by Jessica Serqueira on 15/05/23.
//

import SwiftUI

struct CreateAccountView<ViewModel: CreateAccountViewModelling>: View {
    
    @ObservedObject var viewModel: ViewModel
    @State private var showModal = false
    @State private var isButtonDisable = true
    @State var isShowPhotoLibrary = false
    
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
                }
                .background(Color.white)
                .clipShape(Circle())
                .overlay(Circle().stroke(Color.black, lineWidth: 2))
                .shadow(radius: 8)
                .padding(6)
                .padding(.bottom, 32)
                .sheet(isPresented: $isShowPhotoLibrary) {
                    ImagePicker(selectedImage: $viewModel.image)
                }
                
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
                        viewModel.buttonCreateAccount()
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
                    .disabled(isButtonDisable)
                    .foregroundColor(.gray)
                    .opacity(isButtonDisable ? 0.5 : 1.0)
                    .alert(isPresented: $viewModel.formInvalid) {
                        Alert(title: Text(viewModel.alertText))
                    }
                    .onChange(of: viewModel.createAccount.password) { newValue in
                        let passwordRegex = "^(?=.*[a-z])(?=.*[$@$#!%*?&])(?=.*[1-9])(?=.*[A-Z]).{6,}$"
                        let isValidPassword = newValue.range(of: passwordRegex, options: .regularExpression) != nil
                        let isValidName = !viewModel.createAccount.name.isEmpty
                        let isValidEmail = viewModel.createAccount.email.isValidEmail()
                        isButtonDisable = newValue.isEmpty || !isValidPassword || !isValidName || !isValidEmail
                    }
                    .onChange(of: viewModel.createAccount.name) { newValue in
                        let isValidName = !newValue.isEmpty
                        let isValidPassword = viewModel.createAccount.password.range(of: "^(?=.*[a-z])(?=.*[$@$#!%*?&])(?=.*[1-9])(?=.*[A-Z]).{6,}$", options: .regularExpression) != nil
                        let isValidEmail = viewModel.createAccount.email.isValidEmail()
                        isButtonDisable = newValue.isEmpty || !isValidPassword || !isValidEmail || !isValidName
                    }
                    .onChange(of: viewModel.createAccount.email) { newValue in
                        let isValidEmail = newValue.isValidEmail()
                        let isValidPassword = viewModel.createAccount.password.range(of: "^(?=.*[a-z])(?=.*[$@$#!%*?&])(?=.*[1-9])(?=.*[A-Z]).{6,}$", options: .regularExpression) != nil
                        let isValidName = !viewModel.createAccount.name.isEmpty
                        isButtonDisable = newValue.isEmpty || !isValidPassword || !isValidName || !isValidEmail
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

struct CreateAccountView_Previews: PreviewProvider {
    static var previews: some View {
        let viewModel = CreateAccountViewModel(coordinator: nil)
        CreateAccountView(viewModel: viewModel)
            .previewDisplayName("Create Account")
            .preferredColorScheme(.light)
    }
}
