//
//  ApodResponse.swift
//  NasaApod
//
//  Created by Luis Augusto Silva on 30/10/24.
//

// MARK: - Model
/// Representa la estructura de la respuesta de la API APOD de la NASA
struct ApodResponse: Codable {
    let title: String  // Título de la Imagen Astronómica del Día
    let explanation: String  // Descripción o explicación de la imagen
    let url: String  // URL de la imagen
}
