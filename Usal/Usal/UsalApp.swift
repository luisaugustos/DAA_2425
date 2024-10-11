//
//  UsalApp.swift
//  Usal
//
//  Created by alumno on 4/10/24.
//

import SwiftUI

@main
struct UsalApp: App {
    
    @StateObject private var modelData = ModelData()
    
    var body: some Scene {
        WindowGroup {
            FacultadList().environmentObject(modelData)
        }
    }
}
