//
//  BreedImageView.swift
//  Cat.2
//
//  Created by Ihor Stalevskiy on 27.03.2025.
//

import SwiftUI

struct BreedImageView: View {
    let referenceImageID: String
    let size: CGFloat

    private var imageURL: URL? {
        URL(string: "https://cdn2.thecatapi.com/images/\(referenceImageID).jpg")
    }

    var body: some View {
        AsyncImage(url: imageURL) { image in
            image
                .resizable()
                .scaledToFit()
                .cornerRadius(25)
                .clipped()
                .frame(width: size, height: size)
                
        } placeholder: {
            ZStack {
                RoundedRectangle(cornerRadius: 16)
                    .fill(.gray.opacity(0.2))
                    .frame(width: size, height: size)
                ProgressView()
            }
        }
    }
}

