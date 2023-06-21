//
//  MapsViewModel.swift
//  Features
//
//  Created by Jessica Serqueira on 21/06/23.
//

import SwiftUI
import Domain

public class MapsViewModel: ObservableObject {
    
    private var coordinator: MapsCoordinating?
    
    public init(coordinator: MapsCoordinating?) {
        self.coordinator = coordinator
    }
}

extension MapsViewModel: MapsModelling {
    
}
