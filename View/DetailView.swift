//
//  DetailView.swift
//  Cat.2
//
//  Created by Ihor Stalevskiy on 25.03.2025.
//

import SwiftUI

struct DetailView: View {
    let breed: Breed
    @StateObject private var viewModel: TagViewModel
    
    init(breed: Breed) {
        self.breed = breed
        _viewModel = StateObject(wrappedValue: TagViewModel(temperament: breed.temperament))
    }
    
    private var breedImageURL: URL? {
        URL(
            string:
                "https://cdn2.thecatapi.com/images/\(breed.referenceImageID).jpg"
        )
    }
    
    var body: some View {
        ZStack {
            Colors.background.ignoresSafeArea()
            
            VStack {
                ScrollView {
                    
                    //             Зображення
                    BreedImageView(
                        referenceImageID: breed.referenceImageID, size: 200)
                    
                    // Назва
                    Text(breed.name)
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundColor(Colors.foreground)
                        .padding()
                    // Походження
                    Text(breed.origin)
                        .font(
                            .system(
                                size: 20, weight: .regular, design: .default)
                        )
                        .italic()
                        .fontWeight(.heavy)
                        .foregroundColor(Colors.foreground)
                    
                    // Вага, тривалість життя
                    HStack {
                        VStack {
                            Text("Вага:")
                                .textCase(.uppercase)
                                .fontWeight(.heavy)
                                .multilineTextAlignment(.center)
                            Text(" \(breed.weight.metric) кг")
                        }
                        Rectangle()
                            .frame(width: 1)  // товщина лінії
                            .foregroundColor(.gray)
                        
                        VStack(alignment: .center) {
                            Text("Тривалість життя:")
                                .textCase(.uppercase)
                                .fontWeight(.heavy)
                            
                            Text("\(breed.lifeSpan) років")
                        }
                    }
                    .foregroundColor(Colors.foreground)
                    .padding()
                    VStack(alignment: .center, spacing: 12) {
                        Text("Темперамент:")
                            .font(.headline)
                            .foregroundColor(Colors.foreground)
                            .padding(.horizontal)
                        
                        ForEach(viewModel.rows, id: \.self) { row in
                            HStack(spacing: 8) {
                                ForEach(row) { tag in
                                    Text(tag.name)
                                        .font(.system(size: 14, weight: .medium))
                                        .padding(.horizontal)
                                        .padding(.vertical, 6)
                                        .background(Colors.cardBackground.opacity(0.3))
                                        .foregroundColor(Colors.foreground)
                                        .cornerRadius(12)
                                }
                            }
                            .padding(.horizontal, 8)
                        }
                        
                        // Опис
                        VStack (alignment: .center, spacing: 8){
                            Text("Опис:")
                                .textCase(.uppercase)
                                .fontWeight(.heavy)
                            Text(breed.description)
                            //    .padding(.horizontal, 8)
                        }
                        .padding()
                        // Wikipedia
                        if let wikiURL = URL(string: breed.wikipediaURL) {
                            Link("Wikipedia", destination: wikiURL)
                                .padding(.top)
                        }
                    }
                    .background(Colors.background)
                    .foregroundColor(Colors.foreground)
                    
                }
            }
            
        }
        
    }
}

#Preview {
    NavigationStack {
        DetailView(breed: [Breed].mockList.first!)
    }
}
