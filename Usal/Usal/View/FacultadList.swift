//
//  FacultadList.swift
//  Usal
//
//  Created by alumno on 4/10/24.
//

import SwiftUI

struct FacultadList: View {
    @EnvironmentObject var modelData: ModelData
    @State private var showFavoritesOnly = false

        var filteredFaculty: [Facultad] {
            modelData.facultades.filter { facultad in
                (!showFavoritesOnly || facultad.isFavorite)
            }
        }

    
    var body: some View {
        NavigationSplitView {
            List {
                Toggle(isOn: $showFavoritesOnly) {
                    Text("Favoritos")
                }
                ForEach(filteredFaculty) { facultad in
                    NavigationLink {
                        FacultadDetail(facultad: facultad)
                    } label: {
                        FacultadRow(facultad: facultad)
                    }
                }
            }
            .animation(.default, value: filteredFaculty) //
            .navigationTitle("Facultades")
        } detail: {
            Text("Selecione la facultad")
        }
    }
}

struct FacultadList_Previews: PreviewProvider {
    static var previews: some View {
        //Necesitamos añadir el environmentObject... En versiones más nuevas se utiliza solamente environment()..
        FacultadList().environmentObject(ModelData())
    }
}
