
//
//  LandmarkRow.swift
//  USAL
//
//  Created by Luis Augusto Silva on 3/10/24.
//


import SwiftUI


struct FacultadRow: View {
    var facultad: Facultad


    var body: some View {
        HStack {
            facultad.image
                .resizable()
                .frame(width: 50, height: 50)
            Text(facultad.name)
            Spacer()
        }
    }
}

struct FacultadRow_Previews: PreviewProvider {
    static var previews: some View {
        FacultadRow(facultad: facultades[0])
    }
}
