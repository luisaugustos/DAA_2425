//
//  FavoriteButton.swift
//  USAL
//
//  Created by Luis Augusto Silva on 11/10/24.
//


import SwiftUI


struct FavoriteButton: View {
    @Binding var isSet: Bool


    var body: some View {
            Button {
                isSet.toggle()
            } label: {
                Label("Toggle Favorite", systemImage: isSet ? "star.fill" : "star")
                    .labelStyle(.iconOnly)
                    .foregroundStyle(isSet ? .yellow : .gray)
            }
    }
}
