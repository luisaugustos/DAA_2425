import SwiftUI
import SwiftData
import CoreLocation

struct AgregarCiudadView: View {
    @Environment(\.dismiss) var dismiss
    @Environment(\.modelContext) private var modelContext

    @State private var nombre: String = ""
    @State private var resultados: [CLPlacemark] = []
    @State private var mensajeError: String? = nil

    private let geocoder = CLGeocoder()

    var body: some View {
        NavigationStack {
            Form {
                Section(header: Text("Detalles de la ciudad")) {
                    TextField("Nombre de la ciudad", text: $nombre)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding()

                    if let error = mensajeError {
                        Text("Error: \(error)")
                            .foregroundColor(.red)
                    }
                }

                if !resultados.isEmpty {
                    Section(header: Text("Selecciona una ciudad")) {
                        List(resultados, id: \.self) { placemark in
                            Button(action: {
                                guardarCiudad(placemark: placemark)
                            }) {
                                VStack(alignment: .leading) {
                                    if let localidad = placemark.locality {
                                        Text(localidad)
                                            .font(.headline)
                                    }
                                    if let pais = placemark.country {
                                        Text(pais)
                                            .font(.subheadline)
                                            .foregroundColor(.secondary)
                                    }
                                    if let adminArea = placemark.administrativeArea {
                                        Text(adminArea)
                                            .font(.subheadline)
                                            .foregroundColor(.secondary)
                                    }
                                }
                            }
                        }
                    }
                }
            }
            .navigationTitle("Agregar Ciudad")
            .toolbar {
                ToolbarItem(placement: .confirmationAction) {
                    Button("Buscar") {
                        buscarCoordenadasPorNombre()
                    }
                }
                ToolbarItem(placement: .cancellationAction) {
                    Button("Cancelar") {
                        dismiss()
                    }
                }
            }
        }
    }

    private func buscarCoordenadasPorNombre() {
        // Limpiar el mensaje de error y resultados anteriores
        self.mensajeError = nil
        self.resultados = []

        // Utilizar el geocoder para buscar la ciudad por nombre
        geocoder.geocodeAddressString(nombre) { (placemarks, error) in
            if let error = error {
                self.mensajeError = "No se pudo encontrar la ciudad: \(error.localizedDescription)"
                return
            }

            guard let placemarks = placemarks, !placemarks.isEmpty else {
                self.mensajeError = "No se encontraron resultados para la ciudad ingresada."
                return
            }

            // Guardar todos los resultados en la variable `resultados`
            self.resultados = placemarks
        }
    }

    private func guardarCiudad(placemark: CLPlacemark) {
        guard let location = placemark.location else {
            mensajeError = "No se pueden guardar los datos sin una ubicación válida."
            return
        }

        let nombreCiudad = placemark.locality ?? nombre
        let latitud = location.coordinate.latitude
        let longitud = location.coordinate.longitude

        let nuevaCiudad = Ciudad(nombre: nombreCiudad, latitud: latitud, longitud: longitud)
        modelContext.insert(nuevaCiudad)

        do {
            try modelContext.save()
            dismiss()
        } catch {
            mensajeError = "Error al guardar la nueva ciudad: \(error)"
        }
    }
}