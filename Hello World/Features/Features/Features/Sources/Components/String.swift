//
//  File.swift
//  HelloWorld
//
//  Created by Jessica Serqueira on 17/05/23.
//

import Foundation

extension String {
    
    func isValidEmail() -> Bool {
        // test@email.com -> true
        // test.com -> false
        
        let regex = try! NSRegularExpression(pattern: "^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?(?:\\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?)*(?:\\.com|\\.br)$", options: .caseInsensitive)
        
        return regex.firstMatch(in: self, range: NSRange(location: 0, length: count)) != nil
        
    }
    
    func isValidName(_ name: String) -> Bool {
        let regex = try! NSRegularExpression(pattern: "^[\\p{L}]+([\\p{Zs}\\-][\\p{L}]+)*$", options: .caseInsensitive)
        return regex.firstMatch(in: name, range: NSRange(location: 0, length: name.utf16.count)) != nil
    }
}
