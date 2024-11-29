import SwiftUI
import SwiftData

struct DetalleCiudadView: View {
    @Bindable var ciudad: Ciudad
    @Environment(\.modelContext) private var modelContext

    var body: some View {
        List(ciudad.pronosticos) { pronostico in
            VStack(alignment: .leading) {
                Text("Fecha: \(pronostico.fecha, formatter: dateFormatter)")
                Text("Temperatura: \(pronostico.temperatura)°C")
                Text("Probabilidad de lluvia: \(pronostico.probabilidadLluvia)%")
            }
        }
        .navigationTitle(ciudad.nombre)
        .toolbar {
            Button("Actualizar") {
                actualizarPronostico()
            }
        }
    }

    private func actualizarPronostico() {
        // Lógica para llamar a la API de Open-Meteo y actualizar los pronósticos
    }
}

private let dateFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateStyle = .medium
    return formatter
}()