/*
See the LICENSE.txt file for this sample’s licensing information.

Abstract:
Storage for model data.
 
Created by Luis Augusto Silva on 4/10/24.

*/

import Foundation


@MainActor // Añade este atributo para asegurar que la actualización de UI ocurra en el hilo principal
class ModelData: ObservableObject {
    @Published var facultades: [Facultad] = []

    init() {
        loadFacultades()
    }

    private func loadFacultades() {
        facultades = load("facultades.json")
    }
}


func load<T: Decodable>(_ filename: String) -> T {
    let data: Data

    guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
        else {
            fatalError("Couldn't find \(filename) in main bundle.")
    }

    do {
        data = try Data(contentsOf: file)
    } catch {
        fatalError("Couldn't load \(filename) from main bundle:\n\(error)")
    }

    do {
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    } catch {
        fatalError("Couldn't parse \(filename) as \(T.self):\n\(error)")
    }
}
