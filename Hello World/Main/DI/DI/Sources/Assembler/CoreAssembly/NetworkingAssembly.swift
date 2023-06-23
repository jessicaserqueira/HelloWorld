//
//  NetworkingAssembly.swift
//  DI
//
//  Created by Jessica Serqueira on 23/06/23.
//

import Swinject
import AppData
import Networking

class NetworkingAssembly: Assembly {
    
    func assemble(container: Container) {
        container.register(MapAPIService.self) { _ in MapAPIService() }
        
        container.autoregister(AppData.MapRemoteDataSource.self, initializer: Networking.MapRemoteDataSouce.init)
    }
}
