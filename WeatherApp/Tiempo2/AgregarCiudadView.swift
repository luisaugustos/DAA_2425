//
//  AgregarCiudadView.swift
//  Tiempo2
//
//  Created by alumno on 22/11/24.
//

import SwiftUI
import CoreLocation // para utilizar el geocoder

struct AgregarCiudadView: View {
    @Environment(\.dismiss) var dismiss // cerrar el sheet
    @Environment(\.modelContext) private var modelContext
    @State private var nombre: String = ""
    @State private var resultados: [CLPlacemark] = []
    @State private var msgError: String? = nil
    
    private let geocoder = CLGeocoder()
    
    var body: some View {
        NavigationStack {
            Form {
                Section(header: Text("Detalles ciudad")) {
                    TextField("Nombre de la ciudad", text: $nombre)
                        .padding()
                        .onChange(of: nombre) {
                            buscarCoordenadasCiudad()
                        }
                }
            }
            
            if !resultados.isEmpty {
                Section(header: Text("Selecione la ciudad")) {
                    
                    List(resultados.indices, id: \.self) { index in
                        let place = resultados[index]
                        Button(action: {
                            guardarCiudad(placemark: place)
                        }) {
                            
                            if let localidad = place.locality {
                                Text(localidad)
                                    .font(.headline)
                            }
                            if let subLocality = place.subLocality {
                                Text(subLocality)
                                    .font(.subheadline)
                            }
                            if let pais = place.country {
                                Text(pais)
                                    .font(.subheadline)
                            }
                            
                            if let adminArea = place.administrativeArea {
                                Text(adminArea)
                                    .font(.subheadline)
                            }

                        }
                    }
                    
                }
            }
        }
    }
    
    private func buscarCoordenadasCiudad() {
        self.resultados = []
        
        // metodo para buscar lat,lng de una ciudade pasando nombre por param
        geocoder.geocodeAddressString(nombre) { (places, error) in
            if let error = error {
                print(error.localizedDescription)
                self.msgError = "Error en la busqueda"
                return
            }
            guard let places = places, !places.isEmpty else {
                self.msgError = "No se encontraron resultados para la ciudad"
                return
            }
            print(places)
            self.resultados = places
        }
        
    }
    
    private func guardarCiudad(placemark: CLPlacemark) {
        guard let location = placemark.location else {
            print("No se puede guardar los dados de una ciudad")
            return
        }
        
        let nombreCiudad = placemark.locality ?? nombre
        let latitud = location.coordinate.latitude
        let longitud = location.coordinate.longitude
        
        let nuevaCiudad = Ciudad(nombre: nombreCiudad, latitud: latitud, longitud: longitud)
        
        modelContext.insert(nuevaCiudad) // insert en el SwiftData
        
        do {
            try modelContext.save()
            dismiss() // cerrar el sheet
        } catch {
            print("Error al guardar la nueva ciudad")
        }
        
        
    }
    
}

#Preview {
    AgregarCiudadView()
}
