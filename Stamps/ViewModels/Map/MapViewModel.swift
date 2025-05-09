//
//  SearchComplete.swift
//  Stamps
//
//  Created by You, Jaden on 5/7/25.
//

import MapKit

struct SearchCompletions: Identifiable {
    let id = UUID()
    let title: String
    let subTitle: String
}

@Observable
class MapViewModel: NSObject, MKLocalSearchCompleterDelegate {
    private let completer: MKLocalSearchCompleter
    private var region: MKCoordinateRegion
    var completions: [SearchCompletions] = [SearchCompletions]()
    private var query: String

    init(completer: MKLocalSearchCompleter) {
        self.query = ""
        self.completer = completer
        self.region = completer.region
        super.init()
        self.completer.delegate = self
    }

    func updateQuery(queryFragment: String) {
        completer.resultTypes = .pointOfInterest
        completer.queryFragment = queryFragment
        self.query = queryFragment
    }
    
    func updateRegion(region: MKCoordinateRegion) {
        completer.region = region
        self.region = region
    }

    func completerDidUpdateResults(_ completer: MKLocalSearchCompleter) {
        completions = completer.results.map { .init(title: $0.title, subTitle: $0.subtitle) }
    }
    
    func search() async throws -> [MKMapItem] {
        let request = MKLocalSearch.Request()
        request.naturalLanguageQuery = self.query
        request.region = self.region
        print(request.region)
        let search = MKLocalSearch(request: request)
        let response = try await search.start()
        print(response.mapItems)
        return response.mapItems
    }
}
