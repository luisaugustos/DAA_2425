//
//  ContentView.swift
//  TodoList
//
//  Created by Luis Augusto Silva on 25/10/24.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @Environment(\.modelContext) private var modelContext
    @Query private var items: [Item]
    @State var descriptionNote: String = ""
    
    
    //Cambia el cuerpo de la vista para que se pueda agregar una imagen a la tarea.
    
    
    
    var body: some View {
        NavigationView {
            VStack {
                Text("Añade una tarea")
                    .underline()
                    .foregroundColor(.gray)
                    .padding(.horizontal, 16)
                TextEditor(text: $descriptionNote)
                    .foregroundColor(.gray)
                    .frame(height: 100)
                    .overlay(
                        RoundedRectangle(cornerRadius: 8)
                            .stroke(.green, lineWidth: 2)
                    )
                    .padding(.horizontal, 12)
                    .cornerRadius(3.0)
                Button("Crear") {
                    if !descriptionNote.isEmpty {
                        addItem()
                    }
                }
                .buttonStyle(.bordered)
                .tint(.green)
                
                Spacer()
                List {
                    if (items.count > 0) {
                        ForEach(items) { note in
                            HStack {
                                if note.isFavorited {
                                    Text("⭐️")
                                }
                                Text(note.text)
                            }
                            .swipeActions(edge: .trailing) {
                                Button {
                                    do {
                                        note.isFavorited.toggle()
                                        try modelContext.save()
                                    } catch {
                                        print("Error al guardar la nota: \(error)")
                                    }
                                } label : {
                                    Label("Favorito", systemImage: "star.fill")
                                }
                                .tint(.yellow)
                            }
                            .swipeActions(edge: .leading) {
                                Button {
                                    modelContext.delete(note)
                                } label : {
                                    Label("Borrar", systemImage: "trash.fill")
                                }
                                .tint(.red)
                            }
                        }
                    } else {
                        ContentUnavailableView {
                            Label("No hay Tareas", systemImage: "tray.fill")
                        } description: {
                            Text("Nuevas tareas deben aparecer aquí:")
                        }
                    }
                }
            }
            .navigationTitle("TODO")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                Text("Total: \(items.count)")
            }
        }
    }
    
    private func addItem() {
        withAnimation {
            let newNote = Item(description: descriptionNote, timestamp: Date())
            modelContext.insert(newNote)
            descriptionNote = ""
        }
    }
    
    private func deleteItems(_ item: Item) {
        withAnimation {
            modelContext.delete(item)
        }
    }
    
}

#Preview {
    ContentView()
        .modelContainer(for: Item.self, inMemory: true)
}
