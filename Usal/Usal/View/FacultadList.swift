//
//  FacultadList.swift
//  Usal
//
//  Created by alumno on 4/10/24.
//

import SwiftUI

struct FacultadList: View {
    //Variable de entorno desde UsalApp
    @EnvironmentObject var modelData: ModelData
    
    // Set state variable de filtro (Toogle)
    @State private var showFavouriteOnly = false
    
    var filteredFacultades: [Facultad] {
        modelData.facultades.filter { facultad in
            (!showFavouriteOnly || facultad.isFavorite)
        }
    }
    
    var body: some View {
        NavigationSplitView {
            List {
                Toggle(isOn: $showFavouriteOnly) {
                    Text("Favoritos")
                }
                ForEach(filteredFacultades) { facultad in
                    NavigationLink {
                        FacultadDetail(facultad: facultad)
                    } label: {
                        FacultadRow(facultad: facultad)
                    }
                }
                
            }
            .animation(.default, value: filteredFacultades)
            .navigationTitle("Facultades")
            
        } detail: {
            Text("Selecione la facultad")
        }
        
        
    }
}

struct FacultadList_Previews: PreviewProvider {
    static var previews: some View {
        FacultadList().environmentObject(ModelData())
    }
}
