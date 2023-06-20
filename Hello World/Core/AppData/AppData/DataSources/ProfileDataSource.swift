//
//  File.swift
//  AppData
//
//  Created by Jessica Serqueira on 13/06/23.
//

import Foundation

public protocol ProfileDataSource {
    func fetchProfile(completion: @escaping ([ProfileDTO]) -> Void)
}
