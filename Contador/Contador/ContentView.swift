//
//  ContentView.swift
//  Contador
//
//  Created by Luis Augusto Silva on 27/9/24.
//

import SwiftUI

// Clase modelo
class Contador: ObservableObject {
    @Published var valor: Int = 0
}

// Vista principal
struct ContentView: View {
    // Creamos una instancia de Contador que será observada
    @StateObject private var contador = Contador()
    
    var body: some View {
        VStack(spacing: 20) {
            Text("Contador: \(contador.valor)")
                .font(.largeTitle)
            
            HStack(spacing: 40) {
                Button(action: {
                    if (contador.valor > 0) {
                        contador.valor -= 1
                    }
                    
                }) {
                    Text("-")
                        .font(.largeTitle)
                        .frame(width: 60, height: 60)
                        .background(Color.red.opacity(0.7))
                        .foregroundColor(.white)
                        .cornerRadius(30)
                }
                
                Button(action: {
                    contador.valor += 1
                }) {
                    Text("+")
                        .font(.largeTitle)
                        .frame(width: 60, height: 60)
                        .background(Color.green.opacity(0.7))
                        .foregroundColor(.white)
                        .cornerRadius(30)
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
