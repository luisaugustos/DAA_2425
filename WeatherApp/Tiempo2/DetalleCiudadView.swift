//
//  DetalleCiudadView.swift
//  Tiempo2
//
//  Created by alumno on 22/11/24.
//

import SwiftUI
import Charts

struct DetalleCiudadView: View {
    @Bindable var ciudad: Ciudad
    @Environment(\.modelContext) private var modelContext
    
    private let weatherService = WeatherService() // Instancia del servicio de Open-Meteo
    
    var body: some View {
            ScrollView {
                VStack {
                    // Listado de pronósticos ordenado por fecha
                    List(ciudad.prognosticos.sorted(by: { $0.fecha < $1.fecha })) { pronostico in
                        VStack(alignment: .leading) {
                            Text("Fecha: \(pronostico.fecha, formatter: dateFormatter)")
                            Text("Temperatura: \(String(format: "%.1f", pronostico.temp))°C")
                            Text("Probabilidad de lluvia: \(String(format: "%.1f", pronostico.probabilidadLluvia))%")
                        }
                    }
                    .frame(height: 300) // Ajustar el tamaño para que la lista no ocupe toda la vista
                    
                    // Gráfico de temperaturas
                    Chart(ciudad.prognosticos.sorted(by: { $0.fecha < $1.fecha })) { pronostico in
                        LineMark(
                            x: .value("Fecha", pronostico.fecha),
                            y: .value("Temperatura (°C)", pronostico.temp)
                        )
                        .symbol(by: .value("Fecha", pronostico.fecha))
                    }
                    .frame(height: 200) // Ajustar el tamaño del gráfico
                    
                    
                    // Gráfico de probabilidad de lluvia
                    Chart(ciudad.prognosticos.sorted(by: { $0.fecha < $1.fecha })) { pronostico in
                        BarMark(
                            x: .value("Fecha", pronostico.fecha),
                            y: .value("Probabilidad de Lluvia (%)", pronostico.probabilidadLluvia)
                        )
                    }
                    .frame(height: 200) // Ajustar el tamaño del gráfico
                    
                }
            }.onAppear(
                perform: actualizar
            )
            .navigationTitle(ciudad.nombre)
            .toolbar {
                Button("Actualizar") {
                    actualizar()
                }
            }
        }
    
    private func actualizar() {
            // Llamar al servicio para obtener el pronóstico actualizado
            weatherService.obtenerPronosticoPara(latitud: ciudad.latitud, longitud: ciudad.longitud) { result in
                switch result {
                case .success(let nuevosPronosticos):
                    DispatchQueue.main.async {
                        // Actualizar los pronósticos de la ciudad
                        ciudad.prognosticos = nuevosPronosticos.sorted(by: { $0.fecha < $1.fecha })
                        do {
                            // Guardar los cambios en el contexto
                            try modelContext.save()
                        } catch {
                            print("Error al guardar los pronósticos: \(error)")
                        }
                    }
                case .failure(let error):
                    DispatchQueue.main.async {
                        print("Error al obtener el pronóstico: \(error)")
                    }
                }
            }
        }
}


private let dateFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateFormat = "dd MMMM yyyy" // Formato: día, mes, año (ej. 22 noviembre 2024)
    formatter.locale = Locale(identifier: "es_ES") // Configurar la localización para el idioma español
    return formatter
}()


