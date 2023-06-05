//
//  File.swift
//  Features
//
//  Created by Jessica Serqueira on 24/05/23.
//

import Foundation
import UIKit

struct AccountValidator {
    static func isValidName(_ name: String) -> Bool {
        let regex = try! NSRegularExpression(pattern: "^[\\p{L}]+([\\p{Zs}\\-][\\p{L}]+)*$", options: .caseInsensitive)
        return regex.firstMatch(in: name, range: NSRange(location: 0, length: name.utf16.count)) != nil
    }
    
    static func isValidEmail(_ email: String) -> Bool {
        let regex = try! NSRegularExpression(pattern: "^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?(?:\\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?)*(?:\\.com|\\.br)$", options: .caseInsensitive)
        return regex.firstMatch(in: email, range: NSRange(location: 0, length: email.count)) != nil
    }
    
    static func isValidPassword(_ password: String) -> Bool {
        let passwordRegex = "^(?=.*[a-z])(?=.*[$@$#!%*?&])(?=.*[1-9])(?=.*[A-Z]).{6,}$"
        return password.range(of: passwordRegex, options: .regularExpression) != nil
    }
    
    static func isValidImage(_ image: UIImage) -> Bool {
        return image.size.width > 0 && image.size.height > 0
    }

}
