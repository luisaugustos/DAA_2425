<<<<<<< HEAD
//
//  ImagePicker.swift
//  EjemploPhotos
//
//  Created by Luis Augusto Silva on 8/11/24.
//

import SwiftUI
import SwiftData


=======
>>>>>>> 6b43d81d6ae970004450fd646f57043fa484706d
// Image Picker para seleccionar una imagen de la galería o de la cámara
struct ImagePicker: UIViewControllerRepresentable {
    @Binding var image: UIImage?
    var sourceType: UIImagePickerController.SourceType
    
    func makeUIViewController(context: Context) -> UIImagePickerController {
        let picker = UIImagePickerController()
        picker.sourceType = sourceType
        picker.delegate = context.coordinator
        return picker
    }
    
    func updateUIViewController(_ uiViewController: UIImagePickerController, context: Context) {}
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    class Coordinator: NSObject, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
        let parent: ImagePicker
        
        init(_ parent: ImagePicker) {
            self.parent = parent
        }
        
        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            if let uiImage = info[.originalImage] as? UIImage {
                parent.image = uiImage
            }
            picker.dismiss(animated: true)
        }
    }
<<<<<<< HEAD
}
=======
}
>>>>>>> 6b43d81d6ae970004450fd646f57043fa484706d
