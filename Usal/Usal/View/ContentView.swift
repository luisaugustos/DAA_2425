//
//  ContentView.swift
//  FCiencias
//
//  Created by Luis Augusto Silva on 27/9/24.
//

import SwiftUI


struct ContentView: View {
    var body: some View {
        VStack {
            //Use MapView for iOS 16
            MapView()
                .frame(height: 300)
            //CircleImage()
                .offset(y: -130)
                .padding(.bottom, -130)
            VStack(alignment: .leading) {
                Text("Facultad de Ciencias")
                    .font(.title)
                HStack {
                    Text("Universidad de Salamanca")
                        .font(.subheadline)
                    Spacer()
                    Text("Salamanca")
                        .font(.subheadline)
                }
                .font(.subheadline)
                .foregroundStyle(.secondary)
                
                Divider()
                
                Text("Grado de Ingeniería Informática")
                    .font(.title2)
                    .foregroundStyle(.gray)
            }
            .padding()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        // Preview for iOS 16 and later
        ContentView()
    }
}
