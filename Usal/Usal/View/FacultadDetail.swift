//
//  FacultadDetail.swift
//  Usal
//
//  Created by alumno on 4/10/24.
//

import SwiftUI

struct FacultadDetail: View {
    var facultad: Facultad
    
    var body: some View {
        VStack {
            //Use MapView for iOS 16
            MapView()
                .frame(height: 300)
            CircleImage(image: facultad.image)
                .offset(y: -130)
                .padding(.bottom, -130)
            VStack(alignment: .leading) {
                Text(facultad.name)
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
                
                Text("")
                    .font(.title2)
                    .foregroundStyle(.gray)
            }
            .padding()
        }
    }
}

struct FacultadDetail_Previews: PreviewProvider {
    static var previews: some View {
        FacultadDetail(facultad: facultades[0])
    }
}
