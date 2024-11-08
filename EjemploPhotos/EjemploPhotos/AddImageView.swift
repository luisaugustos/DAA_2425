//
//  ExtractedView.swift
//  EjemploPhotos
//
//  Created by Luis Augusto Silva on 8/11/24.
//

import SwiftUI

struct AddImageView: View {
    @Environment(\.modelContext) private var context
    @State private var name: String = ""
    @State private var image: UIImage? = nil
    @State private var showImagePicker: Bool = false
    @State private var sourceType: UIImagePickerController.SourceType = .photoLibrary
    @Environment(\.presentationMode) var presentationMode
    @State private var showAlert: Bool = false

    var body: some View {
        VStack {
            HStack {
                Button(action: {
                    sourceType = .photoLibrary
                    showImagePicker = true
                }) {
                    Text("Galería de Fotos")
                        .frame(width: 150, height: 50)
                        .background(Color.gray.opacity(0.2))
                        .cornerRadius(10)
                }
                .padding()
                
                Button(action: {
                    sourceType = .camera
                    showImagePicker = true
                }) {
                    Text("Cámara")
                        .frame(width: 150, height: 50)
                        .background(Color.gray.opacity(0.2))
                        .cornerRadius(10)
                }
                .padding()
            }
            
            if let image = image {
                Image(uiImage: image)
                    .resizable()
                    .scaledToFit()
                    .frame(height: 150)
                    .padding()
            }
            
            TextField("Comentario", text: $name)
                .padding()
                .background(Color.gray.opacity(0.2))
                .cornerRadius(10)
                .padding()
            
            Button(action: saveItem) {
                Text("Save Item")
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.blue)
                    .cornerRadius(10)
            }
            .padding()
            .alert(isPresented: $showAlert) {
                Alert(title: Text("Éxito"), message: Text("La foto ha sido guardada exitosamente."), dismissButton: .default(Text("OK")) {
                    presentationMode.wrappedValue.dismiss()
                })
            }
        }
        .sheet(isPresented: $showImagePicker) {
            ImagePicker(image: $image, sourceType: sourceType)
        }
        .navigationTitle("Añadir Nueva Foto")
    }
    
    private func saveItem() {
        guard !name.isEmpty else { return }
        let newItem = Item(name: name, imageData: image?.jpegData(compressionQuality: 0.8))
        context.insert(newItem)
        do {
            try context.save()
            // Mostrar una alerta al usuario
            showAlert = true
        } catch {
            print("Error saving item: \(error)")
        }
    }
}

#Preview {
    AddImageView()
        .modelContainer(for: Item.self, inMemory: true)
}
    
