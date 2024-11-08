//
//  ApodViewModel.swift
//  NasaApod
//
//  Created by Luis Augusto Silva on 30/10/24.
//

// Aplicación NASA APOD en Swift usando Xcode 15 con el patrón MVVM
// Esta aplicación obtiene la Imagen Astronómica del Día (APOD) de la API pública de la NASA

import SwiftUI

// MARK: - ViewModel
class ApodViewModel: ObservableObject {
    @Published var imageUrl: String = ""
    @Published var title: String = ""
    @Published var description: String = ""
    @Published var selectedDate: Date = Date()
    @Published var showAlert: Bool = false
    
    /// Obtiene los datos de la API APOD de la NASA para una fecha específica
    ///
    /// Este método envía una solicitud a la API APOD de la NASA y procesa la respuesta para actualizar la interfaz de usuario.
    func fetchData() {
        // Formatear la fecha a 'YYYY-MM-DD'
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        let dateString = dateFormatter.string(from: selectedDate)
        let API_KEY = "UQ0gVzVkfpLaRHrYWU9pwDNAZuJcPt6dOFAcLT0Y"
        
        // Asegurarse de que la URL es válida
        guard let url = URL(string: "https://api.nasa.gov/planetary/apod?api_key=\(API_KEY)&date=\(dateString)") else {
            print("URL inválida")
            return
        }
        
        // Crear una tarea para recuperar la información de la API
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            // Comprobar si los datos están disponibles y no ocurrió un error
            guard let data = data, error == nil else {
                print("Error al obtener los datos: \(error?.localizedDescription ?? "Error desconocido")")
                return
            }
            
            do {
                // Decodificar la respuesta JSON en la estructura ApodResponse
                let result = try JSONDecoder().decode(ApodResponse.self, from: data)
                // Actualizar la interfaz de usuario en el hilo principal
                DispatchQueue.main.async {
                    self.imageUrl = result.url
                    self.title = result.title
                    self.description = result.explanation
                }
            } catch {
                
                //print data
                print(String(data: data, encoding: .utf8) ?? "No se pudo imprimir los datos")
                // Manejar errores de decodificación JSON
                print("Error al decodificar el JSON: \(error.localizedDescription)")
            }
        }
        // Iniciar la solicitud de red
        task.resume()
    }
}
