//
//  File.swift
//  Domain
//
//  Created by Jessica Serqueira on 17/05/23.
//

import Foundation

public protocol LoginRepository {
    func loginAuthentication(email: String, password: String, completion: @escaping (Result<Void, Error>) -> Void)
}
