//
//  MapView.swift
//  FCiencias
//
//  Created by Luis Augusto Silva on 27/9/24.
//

import SwiftUI
import MapKit



struct MapView: View {
    //var coordinate: CLLocationCoordinate2D
    
    
    @State private var region = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 40.96066312565425, longitude: -5.670170264213592),
        span: MKCoordinateSpan(latitudeDelta: 0.2, longitudeDelta: 0.2)
    )
    
    var body: some View {
        Map(coordinateRegion: $region)
            .edgesIgnoringSafeArea(.all) // Optional: Makes the map fill the entire screen
    }
}

