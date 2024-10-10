//
//  MapView.swift
//  FCiencias
//
//  Created by Luis Augusto Silva on 27/9/24.
//

import SwiftUI
import MapKit

struct MapView: View {
    var coordinate: CLLocationCoordinate2D
    
    @State private var region = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 40.96066312565425, longitude: -5.670170264213592),
        span: MKCoordinateSpan(latitudeDelta: 0.2, longitudeDelta: 0.2)
    ) {
        didSet {
            print("changed to \(region.span.longitudeDelta)")
            print("changed to \(region.span.latitudeDelta)")
        }
    }
    
    var body: some View {
        Map(coordinateRegion: $region)
            .onAppear {
                setRegion(coordinate)
            }
    }
    
    private func setRegion(_ coordinate: CLLocationCoordinate2D) {
        region = MKCoordinateRegion(
            center: coordinate,
            span: MKCoordinateSpan(latitudeDelta: 0.005, longitudeDelta: 0.005)
        )
    }
    
    private func printDeltas(_ region: MKCoordinateRegion) {
        print(region.span.latitudeDelta,region.span.longitudeDelta)
    }
    
    
}

