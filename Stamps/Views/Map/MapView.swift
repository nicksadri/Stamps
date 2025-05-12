//
//  MapView.swift
//  Stamps
//
//  Created by You, Jaden on 5/6/25.
//

import SwiftUI
import MapKit

struct City: Identifiable {
    let id = UUID()
    let name: String
    let coordinate: CLLocationCoordinate2D
}

struct MapView: View {
    @State private var sheetPresented: Bool = false
    @State private var mapViewModel = MapViewModel(completer: .init())
    @State private var query: String = ""
    @State private var searchResults: [MKMapItem] = [MKMapItem]()
    @State private var selectedResult: MKMapItem?
    
    var body: some View {
        VStack {
            Map(position: $mapViewModel.position) {
                ForEach(searchResults, id: \.self) { result in
                    Marker(item: result)
                }
                
            }
            .sheet(isPresented: $sheetPresented) {
                SearchSheetView(mapViewModel: $mapViewModel, query: $query, searchResults: $searchResults)
            }
            .onMapCameraChange { context in
                mapViewModel.updateRegion(region: context.region)
            }
            .onChange(of: searchResults) {
                if let topResult = searchResults.first, searchResults.count == 1 {
                    selectedResult = topResult
                }
            }
            .ignoresSafeArea()
            Button("Search") {
                sheetPresented.toggle()
            }
        }
    }
}

#Preview {
    MapView()
}
