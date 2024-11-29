//
//  ContentView.swift
//  Alarma
//
//  Created by alumno on 29/11/24.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject private var alarma = AlarmaViewModel()
    
    var body: some View {
        VStack {
            Text("Alarma")
                .font(.largeTitle)
            DatePicker("Seleccione la hora de la alarma", selection: $alarma.hora, displayedComponents: .hourAndMinute)
                .labelsHidden()
                .datePickerStyle(.wheel)
                .padding()
            
            Button(action:{
                alarma.setAlarma()
            }) {
                Text("Configurar alarma")
                .padding()
                .background(Color.blue)
                .foregroundColor(.white)
                .cornerRadius(8)
            }
            
        }
        .padding()
        .onAppear{
            NotificationManager.shared.requestAuthorization()
        }
    }
}

#Preview {
    ContentView()
}
