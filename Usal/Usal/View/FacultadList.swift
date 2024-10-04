//
//  FacultadList.swift
//  Usal
//
//  Created by alumno on 4/10/24.
//

import SwiftUI

struct FacultadList: View {
    var body: some View {
        NavigationSplitView {
            List(facultades) { facultad in
                NavigationLink {
                    FacultadDetail(facultad: facultad)
                } label: {
                    FacultadRow(facultad: facultad)
                }
            }
        } detail: {
            Text("selecione la facultad")
        }
        
    }
}

struct FacultadList_Previews: PreviewProvider {
    static var previews: some View {
        FacultadList()
    }
}
