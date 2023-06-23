//
//  MapRemoteDataSouce.swift
//  AppData
//
//  Created by Jessica Serqueira on 23/06/23.
//

import Foundation

public protocol MapRemoteDataSource {
    func getLocation(address: String, delta: Double)
}
