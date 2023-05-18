//
//  File.swift
//  Domain
//
//  Created by Jessica Serqueira on 17/05/23.
//

import Foundation

public protocol LoginUseCaseProtocol {
    func loginAuthentication(email: String, password: String, completion: @escaping (Result<Void, Error>) -> Void)
}
