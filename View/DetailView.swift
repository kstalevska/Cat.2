//
//  DetailView.swift
//  Cat.2
//
//  Created by Ihor Stalevskiy on 25.03.2025.
//

import SwiftUI

struct DetailView: View {
    let breed: Breed

    private var tags: [String] {
        breed.temperament
            .components(separatedBy: ", ")
            .filter { !$0.isEmpty }
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

                    // Походження
                    Text(breed.origin)
                        .font(
                            .system(
                                size: 20, weight: .regular, design: .default)
                        )
                        .italic()
                        .fontWeight(.heavy)

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

                    TagListView(title: "Темперамент:", tags: tags)
                        .padding()
                    // Опис

                    Text("Опис:")
                        .textCase(.uppercase)
                        .fontWeight(.heavy)
                        .padding(.vertical, 18)
                    Text(breed.description)
                        .padding(.horizontal)
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

#Preview {
    NavigationStack {
        DetailView(breed: [Breed].mockList.first!)
    }
}
