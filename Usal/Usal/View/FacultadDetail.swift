//
//  FacultadDetail.swift
//  Usal
//
//  Created by alumno on 4/10/24.
//

import SwiftUI

struct FacultadDetail: View {
    @EnvironmentObject var modelData: ModelData
    var facultad: Facultad
    
    var facultadIndex: Int {
        modelData.facultades.firstIndex(where: { $0.id == facultad.id })!
    }

    
    var body: some View {
        @ObservedObject var modelData = modelData
        
        ScrollView {
            //Use MapView for iOS 16
            MapView(coordinate: facultad.locationCoordinates)
                .frame(height: 300)
            CircleImage(image: facultad.image)
                .offset(y: -130)
                .padding(.bottom, -130)
            VStack(alignment: .leading) {
                HStack {
                    Text(facultad.name)
                    .font(.title)
                    FavoriteButton(isSet: $modelData.facultades[facultadIndex].isFavorite)
                }
                HStack {
                    Text("Universidad de Salamanca")
                        .font(.subheadline)
                    Spacer()
                    Text(facultad.city)
                        .font(.subheadline)
                }
                .font(.subheadline)
                .foregroundStyle(.secondary)
                
                Divider()
                
                Text("Sobre la facultad:")
                    .font(.subheadline)
                    .foregroundStyle(.gray)
                Text(facultad.description)
            }
            .padding()
        }
        .navigationTitle(facultad.name)
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct FacultadDetail_Previews: PreviewProvider {
    static var previews: some View {
        FacultadDetail(facultad:  ModelData().facultades[2]).environmentObject(ModelData())
    }
}
