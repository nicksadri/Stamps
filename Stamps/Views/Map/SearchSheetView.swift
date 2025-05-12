//
//  SearchSheetView.swift
//  Stamps
//
//  Created by You, Jaden on 5/7/25.
//

import SwiftUI
import MapKit

struct SearchSheetView: View {
    @Binding var mapViewModel: MapViewModel
    @Binding var query: String
    @Binding var searchResults: [MKMapItem]

    var body: some View {
        VStack {
            HStack {
                Image(systemName: "magnifyingglass")
                TextField("Search for a restaurant", text: $query)
                    .autocorrectionDisabled()
                    .onSubmit {
                        Task { 
                            searchResults = (try? await mapViewModel.search()) ?? []
                        }
                    }
            }
            Spacer()
            List {
                ForEach(mapViewModel.completions) { completion in
                    Button(action: { }) {
                        VStack(alignment: .leading, spacing: 4) {
                            Text(completion.title)
                                .font(.headline)
                                .fontDesign(.rounded)
                            Text(completion.subTitle)
                        }
                    }
                    .listRowBackground(Color.clear)
                }
            }
            .listStyle(.plain)
            .scrollContentBackground(.hidden)
        }
        .onChange(of: query) {
            mapViewModel.updateQuery(queryFragment: query)
        }
        .padding()
        .presentationDetents([.height(250), .large])
        .presentationBackground(.regularMaterial)
        .presentationBackgroundInteraction(.enabled(upThrough: .large))
    }
}

