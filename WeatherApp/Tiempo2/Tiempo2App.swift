//
//  Tiempo2App.swift
//  Tiempo2
//
//  Created by alumno on 22/11/24.
//

import SwiftUI
import SwiftData

@main
struct Tiempo2App: App {
    var sharedModelContainer: ModelContainer = {
        let schema = Schema([
            Ciudad.self, Prognostico.self
        ])
        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)

        do {
            return try ModelContainer(for: schema, configurations: [modelConfiguration])
        } catch {
            fatalError("Could not create ModelContainer: \(error)")
        }
    }()

    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(sharedModelContainer)
    }
}
