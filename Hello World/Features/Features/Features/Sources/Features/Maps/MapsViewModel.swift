//
//  MapsViewModel.swift
//  Features
//
//  Created by Jessica Serqueira on 21/06/23.
//

import SwiftUI
import Domain
import MapKit

public class MapsViewModel: ObservableObject {
    private var coordinator: MapsCoordinating?
    
    @Published var selectedAnnotation: AnnotationItemModel? = nil
    @Published var mapAnnotations: [AnnotationItemModel] = []
    
    public init(coordinator: MapsCoordinating?) {
        self.coordinator = coordinator
    }
}

extension MapsViewModel: MapsModelling {    
    public func addAnnotation(coordinate: CLLocationCoordinate2D) {
        let annotation = AnnotationItemModel(title: "", coordinate: coordinate)
        mapAnnotations.append(annotation)
    }
}
