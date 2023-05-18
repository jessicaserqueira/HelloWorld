//
//  File.swift
//  HelloWorld
//
//  Created by Jessica Serqueira on 17/05/23.
//

import SwiftUI

public struct EmailTextField: View {
    
    @Binding var email: String
    public var borderColor: Color = .black
    
    public var body: some View {
        HStack {
            if #available(iOS 15.0, *) {
                TextField(L10n.Login.TextField.title, text: $email, prompt: Text(L10n.Login.TextField.placeHolder).foregroundColor(.black))
                    .keyboardType(.emailAddress)
                    .font(Font.custom("Nunito-Medium", size: 16))
                    .foregroundColor(.black)
                    .background(Color.clear)
                    .autocapitalization(.none)
                    .autocorrectionDisabled(false)
                if(email.count != 0) {
                    
                    Image(systemName: email.isValidEmail() ? "checkmark" : "xmark")
                        .foregroundColor(email.isValidEmail() ? .green : .red)
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
