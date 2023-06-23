//
//  MapsView.swift
//  Features
//
//  Created by Jessica Serqueira on 21/06/23.
//

import SwiftUI
import MapKit

struct MapsView: View {
    @ObservedObject var viewModel: MapsViewModel
    @State private var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: -20.0789, longitude: -45.2987), span: MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1))
    
    var body: some View {
        VStack {
            Map(coordinateRegion: $region, annotationItems: viewModel.mapAnnotations) { annotation in
                MapAnnotation(coordinate: annotation.coordinate) {
                    Image(systemName: "mappin.circle.fill")
                        .foregroundColor(.red)
                        .onTapGesture {
                            viewModel.selectedAnnotation = annotation
                        }
                }
            }
            .ignoresSafeArea()
            .onAppear {
                // Chamada para carregar os dados do mapa ou realizar qualquer inicialização necessária
            }
            .sheet(item: $viewModel.selectedAnnotation) { annotation in
                // Aqui você pode apresentar uma view de detalhes ou formulário para permitir que o usuário adicione mais informações sobre a marcação
                // Por exemplo, você pode usar um modal sheet ou uma navegação para uma nova view de edição
                Text("Adicionar informações sobre a marcação com a coordenada \(annotation.coordinate.latitude), \(annotation.coordinate.longitude)")
            }
            
            Button("Adicionar Marcação") {
                // Exemplo de chamada para adicionar uma nova marcação no mapa
                let newCoordinate = CLLocationCoordinate2D(latitude: 40.7128, longitude: -74.0060) // Coordenadas de Nova York
                viewModel.addAnnotation(coordinate: newCoordinate)
            }
        }
    }
}
