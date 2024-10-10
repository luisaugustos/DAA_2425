//
//  FacultadRow.swift
//  Usal
//
//  Created by alumno on 4/10/24.
//

import SwiftUI

struct FacultadRow: View {
    var facultad: Facultad
    
    var body: some View {
        HStack {
            facultad.image
                .resizable()
                .frame(width: 60, height: 60)
            Text(facultad.name)
            Spacer()
        }
    }
}

struct FacultadRow_Previews: PreviewProvider {
    static var previews: some View {
        FacultadRow(facultad: facultades[1])
    }
}
