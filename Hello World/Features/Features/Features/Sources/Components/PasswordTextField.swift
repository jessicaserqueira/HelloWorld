//
//  File.swift
//  HelloWorld
//
//  Created by Jessica Serqueira on 17/05/23.
//

import SwiftUI

public struct PasswordTextField: View {
    
    @Binding public var password: String
    public var borderColor: Color = .black
    @State private var isSecureTextEntry = true
    
    public func isValidPassword(_ password: String) -> Bool {
        // minimum 6 characters long
        // 1 uppercase character
        // 1 special character
        
        let passwordRegex = NSPredicate(format: "SELF MATCHES %@", "^(?=.*[a-z])(?=.*[$@$#!%*?&])(?=.*[1-9])(?=.*[A-Z]).{6,}$")
        
        return passwordRegex.evaluate(with: password)
    }
    
    public var body: some View {
        HStack {
            if #available(iOS 15.0, *) {
                if isSecureTextEntry {
                    SecureField(L10n.Login.TextFieldPassword.title, text: $password, prompt: Text(L10n.Login.TextFieldPassword.placeholder).foregroundColor(.black))
                        .keyboardType(.numbersAndPunctuation)
                        .font(Font.custom("Nunito-Medium", size: 16))
                        .foregroundColor(.black)
                        .background(Color.clear)
                        .autocorrectionDisabled(false)
                } else {
                    TextField(L10n.Login.TextFieldPassword.title, text: $password, prompt: Text(L10n.Login.TextFieldPassword.placeholder).foregroundColor(.black))
                        .keyboardType(.numbersAndPunctuation)
                        .font(Font.custom("Nunito-Medium", size: 16))
                        .foregroundColor(.black)
                        .background(Color.clear)
                }
                Button(action: {
                    isSecureTextEntry.toggle()
                }, label: {
                    Image(systemName: isSecureTextEntry ? "eye.slash" : "eye")
                        .foregroundColor(.black)
                })
                
                if(password.count != 0) {
                    Image(systemName: isValidPassword(password) ? "checkmark" : "xmark")
                        .foregroundColor(isValidPassword(password) ? .green : .red)
                }
            } else {
                // Fallback on earlier versions
            }
        }
        .padding(12)
        .frame(height: 48)
        .background(Color.white.opacity(0.4))
        .overlay(RoundedRectangle(cornerRadius: 10).stroke(borderColor, lineWidth: 2))
    }
}
