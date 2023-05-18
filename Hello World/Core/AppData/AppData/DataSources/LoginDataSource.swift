//
//  File.swift
//  AppData
//
//  Created by Jessica Serqueira on 17/05/23.
//

import Foundation

public protocol LoginDataSource: AnyObject {
    func loginAuthentication(email: String, password: String, completion: @escaping (Result<Void, Error>) -> Void)
}
