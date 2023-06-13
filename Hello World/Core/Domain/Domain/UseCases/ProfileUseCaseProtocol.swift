//
//  File.swift
//  Domain
//
//  Created by Jessica Serqueira on 13/06/23.
//

import Foundation

public protocol ProfileUseCaseProtocol {
    func fetchContacts(completion: @escaping ([Profile]) -> Void)
}
