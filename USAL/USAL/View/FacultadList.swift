//
//  FacultadListList.swift
//  USAL
//
//  Created by Luis Augusto Silva on 4/10/24.
//


import SwiftUI


struct FacultadList: View {
    var body: some View {
        List(facultades) { facultad in
            FacultadRow(facultad: facultad)
        }
    }
}

struct FacultadList_Previews: PreviewProvider {
    static var previews: some View {
        FacultadList()
    }
}
