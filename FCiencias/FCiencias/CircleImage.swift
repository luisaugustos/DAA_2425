//
//  CircleImage.swift
//  FCiencias
//
//  Created by Luis Augusto Silva on 27/9/24.
//  DAA_2425 repo


import SwiftUI


struct CircleImage: View {
    var body: some View {
        Image("facultad_ciencias")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .clipShape(Circle())
            .overlay {
                Circle().stroke(Color(.lightGray), lineWidth: 4)
            }
            .shadow(radius: 7)
    }
}
