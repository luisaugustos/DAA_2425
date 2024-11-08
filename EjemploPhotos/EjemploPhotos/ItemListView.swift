//
//  ItemListView.swift
//  EjemploPhotos
//
//  Created by Luis Augusto Silva on 8/11/24.
//

import SwiftUI
import SwiftData

struct ItemListView: View {
    @Environment(\.modelContext) private var context
    @State private var items: [Item] = []
    @State private var viewMode: ViewMode = .list
    
    enum ViewMode {
        case list, gallery
    }
    
    var body: some View {
        VStack {
            Picker("Vista", selection: $viewMode) {
                Text("Listado").tag(ViewMode.list)
                Text("Galería").tag(ViewMode.gallery)
            }
            .pickerStyle(SegmentedPickerStyle())
            .padding()
            
            if viewMode == .list {
                List(items, id: \.id) { item in
                    NavigationLink(destination: ItemDetailView(item: item)) {
                        HStack {
                            if let data = item.imageData, let uiImage = UIImage(data: data) {
                                Image(uiImage: uiImage)
                                    .resizable()
                                    .frame(width: 50, height: 50)
                                    .clipShape(Circle())
                            }
                            Text(item.name)
                        }
                    }
                }
            } else {
                ScrollView {
                    LazyVGrid(columns: [GridItem(.adaptive(minimum: 100))]) {
                        /*
                         Prueba de imagen de ejemplo
                         Image("example")
                        .resizable()
                        .aspectRatio(1, contentMode: .fit)
                         */
                        ForEach(items, id: \.id) { item in
                            VStack {
                                
                                if let data = item.imageData, let uiImage = UIImage(data: data) {
                                    Image(uiImage: uiImage)
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 100, height: 100)
                                        .clipShape(RoundedRectangle(cornerRadius: 10))
                                }
                                Text(item.name)
                                    .font(.caption)
                                    .lineLimit(1)
                            }
                        }
                    }
                    .padding()
                }
            }
        }
        .navigationTitle("Items")
        .onAppear(perform: fetchItems)
    }
    
    private func fetchItems() {
        let fetchDescriptor = FetchDescriptor<Item>()
        do {
            let fetchedItems = try context.fetch(fetchDescriptor)
            self.items = fetchedItems
        } catch {
            print("Error fetching items: \(error)")
        }
    }
}

//generate a fake preview to test the view with images

#Preview {
    ItemListView()
        .modelContainer(for: Item.self, inMemory: true)
}
