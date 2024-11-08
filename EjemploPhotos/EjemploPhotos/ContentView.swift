//
//  ContentView.swift
//  EjemploPhotos
//
//  Created by Luis Augusto Silva on 8/11/24.
<<<<<<< HEAD
//  
=======
//
>>>>>>> 6b43d81d6ae970004450fd646f57043fa484706d

import SwiftUI
import SwiftData

struct ContentView: View {
<<<<<<< HEAD
    var body: some View {
        NavigationView {
            SidebarView()
            ItemListView() // Vista predeterminada para ver el listado de ítems
=======
    @Environment(\.modelContext) private var modelContext
    @Query private var items: [Item]

    var body: some View {
        NavigationSplitView {
            List {
                ForEach(items) { item in
                    NavigationLink {
                        Text("Item at \(item.timestamp, format: Date.FormatStyle(date: .numeric, time: .standard))")
                    } label: {
                        Text(item.timestamp, format: Date.FormatStyle(date: .numeric, time: .standard))
                    }
                }
                .onDelete(perform: deleteItems)
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    EditButton()
                }
                ToolbarItem {
                    Button(action: addItem) {
                        Label("Add Item", systemImage: "plus")
                    }
                }
            }
        } detail: {
            Text("Select an item")
        }
    }

    private func addItem() {
        withAnimation {
            let newItem = Item(timestamp: Date())
            modelContext.insert(newItem)
        }
    }

    private func deleteItems(offsets: IndexSet) {
        withAnimation {
            for index in offsets {
                modelContext.delete(items[index])
            }
>>>>>>> 6b43d81d6ae970004450fd646f57043fa484706d
        }
    }
}

<<<<<<< HEAD
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


=======
>>>>>>> 6b43d81d6ae970004450fd646f57043fa484706d
#Preview {
    ContentView()
        .modelContainer(for: Item.self, inMemory: true)
}
<<<<<<< HEAD


=======
>>>>>>> 6b43d81d6ae970004450fd646f57043fa484706d
