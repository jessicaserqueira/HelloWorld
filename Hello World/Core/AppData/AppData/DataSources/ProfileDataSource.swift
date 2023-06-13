//
//  File.swift
//  AppData
//
//  Created by Jessica Serqueira on 13/06/23.
//

import Foundation

public protocol ProfileDataSource {
    func fetchContacts(completion: @escaping ([ProfileDTO]) -> Void)
}
