//
//  SearchComplete.swift
//  Stamps
//
//  Created by You, Jaden on 5/7/25.
//

import MapKit
import SwiftUI

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
    private var locationManager = LocationManager()
    var position: MapCameraPosition = .userLocation(followsHeading: false, fallback: .automatic)
    
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
        self.position = .region(self.region)
    }
    
    func search() async throws -> [MKMapItem] {
        let request = MKLocalSearch.Request()
        request.naturalLanguageQuery = self.query
        request.region = self.region
        request.resultTypes = .pointOfInterest
        
        let search = MKLocalSearch(request: request)
        let response = try await search.start()
        let results = response.mapItems
        print(results)
        let region = resultUpdateRegion(results: results)
        
        self.region = region!
        return results
    }
    
    private func resultUpdateRegion(results: [MKMapItem]) -> MKCoordinateRegion? {
        guard !results.isEmpty else {return nil}
        
        var minLat = results.first!.placemark.coordinate.latitude
        var maxLat = results.first!.placemark.coordinate.latitude
        var minLong = results.first!.placemark.coordinate.longitude
        var maxLong = results.first!.placemark.coordinate.longitude
        
        for result in results {
            minLat = min(minLat, result.placemark.coordinate.latitude)
            maxLat = max(maxLat, result.placemark.coordinate.latitude)
            minLong = min(minLong, result.placemark.coordinate.longitude)
            maxLong = max(maxLong, result.placemark.coordinate.longitude)
        }
        
        let span = MKCoordinateSpan(
                latitudeDelta: (maxLat - minLat) * 1.2,
                longitudeDelta: (maxLong - minLong) * 1.2
        )
        
        let center = locationManager.location!.coordinate
        
        return MKCoordinateRegion(center: center, span: span)
        
    }
 }
