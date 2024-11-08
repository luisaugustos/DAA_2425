//
//  ContentView.swift
//  NasaApod
//
//  Created by Luis Augusto Silva on 30/10/24.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = ApodViewModel()
    
    var body: some View {
        NavigationView {
            ScrollView {
                
        
                // Add a button here
                Button(action: {
                    viewModel.fetchData()
                }) {
                    Text("Fetch Data")
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
                
                VStack(alignment: .leading, spacing: 20) {
                    HStack {
                        
                        
                        
                        
                        
                        DatePicker("Select Date", selection: $viewModel.selectedDate, displayedComponents: .date)
                            .datePickerStyle(CompactDatePickerStyle())
                            .onChange(of: viewModel.selectedDate) { _ in
                                viewModel.fetchData()
                            }
                            .labelsHidden()
                            .padding(.leading)
                        
                        Spacer()
                        
                        Button(action: {
                            viewModel.selectedDate = Date()
                            viewModel.fetchData()
                        }) {
                            Text("Today")
                                .padding(.horizontal)
                                .padding(.vertical, 8)
                                .background(Color.blue)
                                .foregroundColor(.white)
                                .cornerRadius(8)
                        }
                        .padding(.trailing)
                    }
                    .background(Color(UIColor.secondarySystemBackground))
                    .cornerRadius(10)
                    
                    
                    if let url = URL(string: viewModel.imageUrl) {
                        AsyncImage(url: url) { image in
                            image
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(maxWidth: .infinity, maxHeight: 400)
                                .clipped()
                                .cornerRadius(15)
                        } placeholder: {
                            ProgressView()
                                .frame(maxWidth: .infinity, maxHeight: 400)
                        }
                    } else {
                        ContentUnavailableView(
                            "No Images from APOD",
                            systemImage: "doc.richtext.fill",
                            description: Text("Try to search for another date")
                        )
                    }
                    
                    VStack(alignment: .leading, spacing: 10) {
                        Text(viewModel.title)
                            .font(.title)
                            .fontWeight(.bold)
                            .padding(.horizontal)
                            
                        Text(viewModel.description)
                            .font(.body)
                            .padding(.horizontal)
                    }
                    .padding(.bottom, 20)
                }
                .padding()
            }
            .navigationTitle("NASA APOD")
            .alert(isPresented: $viewModel.showAlert) {
                Alert(title: Text("Rate Limit Exceeded"), message: Text("You have exceeded your rate limit. Try again later or contact support."), dismissButton: .default(Text("OK")))
            }
            .onAppear(perform: { viewModel.fetchData() })
        }
    }
}

#Preview {
    ContentView()
}
