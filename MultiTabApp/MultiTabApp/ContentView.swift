//
//  ContentView.swift
//  MultiTabApp
//
//  Created by Luis Augusto Silva on 4/10/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            HomeView()
                .tabItem {
                    Label("Home", systemImage: "house")
                }

            SettingsView()
                .tabItem {
                    Label("Settings", systemImage: "gearshape")
                }
        }
    }
}

struct HomeView: View {
    var body: some View {
        NavigationView {
            VStack {
                Text("Welcome to the Home Tab")
                    .font(.largeTitle)
                    .padding()
                
                NavigationLink(destination: DetailView()) {
                    Text("Go to Detail")
                        .foregroundColor(.blue)
                        .padding()
                        .background(Color.gray.opacity(0.2))
                        .cornerRadius(10)
                }
            }
            .navigationTitle("Home")
        }
    }
}

struct SettingsView: View {
    @State private var isOn = true

    var body: some View {
        NavigationView {
            Form {
                Toggle(isOn: $isOn) {
                    Text("Enable Notifications")
                }
            }
            .navigationTitle("Settings")
        }
    }
}

struct DetailView: View {
    var body: some View {
        Text("This is the Detail View")
            .font(.title)
            .navigationTitle("Detail")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        // Preview for iOS 16 and later
        ContentView()
    }
}
