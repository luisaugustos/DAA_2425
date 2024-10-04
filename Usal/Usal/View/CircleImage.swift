//
//  CircleImage.swift
//  FCiencias
//
//  Created by Luis Augusto Silva on 27/9/24.
//  DAA_2425 repo


import SwiftUI


struct CircleImage: View {
    var image: Image
    
    var body: some View {
        image
            .resizable()
            .aspectRatio(contentMode: .fit)
            .clipShape(Circle())
            .overlay {
                Circle().stroke(Color(.lightGray), lineWidth: 4)
            }
            .shadow(radius: 7)
    }
}

struct CircleImage_Previews: PreviewProvider {
    static var previews: some View {
        // Preview for iOS 16 and later
        CircleImage(image: Image("facultad_ciencias"))
    }
}
