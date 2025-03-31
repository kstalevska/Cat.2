//
//  BreedCardView.swift
//  Cat.2
//
//  Created by Ihor Stalevskiy on 25.03.2025.
//

import SwiftUI

struct BreedCardView: View {
    let breed: Breed
    
    var body: some View {
        ZStack {
            Colors.background.ignoresSafeArea()
            VStack(alignment: .leading, spacing: 8) {
                Text("🐱\(breed.name)")
                    .fontWeight(.heavy)
                    .textCase(.uppercase)
                    .foregroundColor(Colors.foreground)
                HStack {
                    Text("Вага:")
                        .fontWeight(.semibold)
                        .fontWeight(.heavy)
                        .font(.subheadline)
                        .lineLimit(3)
                        .foregroundColor(.white.opacity(0.8))
                    Spacer()
                    Text("\(breed.weight.metric) кг")
                        .foregroundColor(Colors.foreground)
                }
                
                HStack {
                    Text("Тривалість життя:")
                        .fontWeight(.semibold)
                        .fontWeight(.heavy)
                        .font(.subheadline)
                        .foregroundColor(.white.opacity(0.8))
                    Spacer()
                    Text("\(breed.lifeSpan) років")
                    
                        .foregroundColor(Colors.foreground)
                }
                .font(.footnote)
                .foregroundColor(.white.opacity(0.7))
            }
            .padding()
            .background(
                RoundedRectangle(cornerRadius: 16)
                    .fill(Color(hue: 0.54, saturation: 0.50, brightness: 0.43))
                
            )
            .overlay(
                RoundedRectangle(cornerRadius: 16)
                    .stroke(Color.white.opacity(0.1), lineWidth: 1)
            )
            .shadow(radius: 4)
            .padding(.vertical, 4)
        }
    }
}

#Preview {
    BreedCardView(breed: [Breed].mockList.first!)
     
}

