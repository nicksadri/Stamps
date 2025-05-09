//
//  ContentView.swift
//  Stamps
//
//  Created by Nick Sadri on 3/27/25.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var locationManager = LocationManager()
    
    var body: some View {
        SignUpFlowView()
        .onAppear {
        // Ensure permission request on launch
        locationManager.manager.requestWhenInUseAuthorization()
        }
    }
}

#Preview {
    ContentView()
}
