import Foundation
import CoreLocation

class WeatherService {
    private let baseURL = "https://api.open-meteo.com/v1/forecast"

    func obtenerPronosticoPara(latitud: Double, longitud: Double, completion: @escaping (Result<[Pronostico], Error>) -> Void) {
        // Construir la URL con los parámetros necesarios
        let urlString = "\(baseURL)?latitude=\(latitud)&longitude=\(longitud)&daily=temperature_2m_max,precipitation_probability_max&timezone=Europe/Madrid"
        guard let url = URL(string: urlString) else {
            completion(.failure(NSError(domain: "", code: -1, userInfo: [NSLocalizedDescriptionKey: "URL inválida"])))
            return
        }

        // Realizar la solicitud HTTP
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                completion(.failure(error))
                return
            }

            guard let data = data else {
                completion(.failure(NSError(domain: "", code: -1, userInfo: [NSLocalizedDescriptionKey: "Datos no recibidos"])))
                return
            }

            do {
                // Decodificar la respuesta JSON
                let decoder = JSONDecoder()
                decoder.dateDecodingStrategy = .iso8601
                let respuesta = try decoder.decode(RespuestaOpenMeteo.self, from: data)
                let pronosticos = respuesta.daily.time.enumerated().map { index in
                    Pronostico(
                        fecha: respuesta.daily.time[index],
                        temperatura: respuesta.daily.temperature_2m_max[index],
                        probabilidadLluvia: respuesta.daily.precipitation_probability_max[index]
                    )
                }
                completion(.success(pronosticos))
            } catch {
                completion(.failure(error))
            }
        }
        task.resume()
    }
}

// Modelo para decodificar la respuesta de la API
struct RespuestaOpenMeteo: Codable {
    struct Daily: Codable {
        let time: [Date]
        let temperature_2m_max: [Double]
        let precipitation_probability_max: [Double]
    }
    let daily: Daily
}