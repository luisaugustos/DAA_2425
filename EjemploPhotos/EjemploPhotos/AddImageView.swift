//
//  ExtractedView.swift
//  EjemploPhotos
//
//  Created by Luis Augusto Silva on 8/11/24.
//


struct ExtractedView: View {
    var body: some View {
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
    }
}