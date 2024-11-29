//
//  ContentView.swift
//  Tiempo2
//
//  Created by alumno on 22/11/24.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @Environment(\.modelContext) private var modelContext
    @Query(sort: \Ciudad.nombre) private var ciudades: [Ciudad]
    @State private var mostrarAddCiudad = false

    var body: some View {
        NavigationStack {
            List(ciudades) { ciudad in
                NavigationLink(destination: DetalleCiudadView(ciudad: ciudad)) {
                    Text(ciudad.nombre)
                }
            }
            .navigationTitle("Tiempo")
            .toolbar {
                Button(action: {
                    mostrarAddCiudad = true // mostrar el sheet
                }) {
                    Label("Agregar Ciudad", systemImage: "plus")
                }
            }
            .sheet(isPresented: $mostrarAddCiudad) {
                AgregarCiudadView() // añadir ciudad view
            }
        }
        
    }

    
}

#Preview {
    ContentView()
        .modelContainer(for: [Ciudad.self, Prognostico.self], inMemory: true)
}
