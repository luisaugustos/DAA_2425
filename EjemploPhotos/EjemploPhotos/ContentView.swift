//
//  ContentView.swift
//  EjemploPhotos
//
//  Created by Luis Augusto Silva on 8/11/24.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    var body: some View {
        NavigationView {
            SidebarView()
            ItemListView() // Vista predeterminada para ver el listado de ítems
        }
    }
}

struct SidebarView: View {
    var body: some View {
        List {
            NavigationLink(destination: ItemListView()) {
                Text("Ver Listado de Items")
            }
            NavigationLink(destination: AddImageView()) {
                Text("Añadir Nueva Foto")
            }
        }
        .navigationTitle("Menú Principal")
    }
}


#Preview {
    ContentView()
        .modelContainer(for: Item.self, inMemory: true)
}


