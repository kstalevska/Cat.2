//
//  ContentView.swift
//  Cat.2
//
//  Created by Ihor Stalevskiy on 25.03.2025.
//

import SwiftUI

struct HomeView: View {
    @StateObject private var viewModel = HomeViewModel()

    var body: some View {
        NavigationStack {
            ZStack {
                // 🔹 Фон на весь екран
                Colors.background
                    .ignoresSafeArea()

                VStack(spacing: 16) {
                    
                    // 🔹 Верхнє зображення
                    if let firstBreed = viewModel.breeds.first {
                        BreedImageView(referenceImageID: firstBreed.referenceImageID, size: 200)
                            .padding(.top, 16)
                    }

                    // 🔹 Список порід
                    if viewModel.breeds.isEmpty {
                        ProgressView("Завантаження порід...")
                            .padding()
                    } else {
                        ScrollView {
                            LazyVStack(spacing: 16) {
                                ForEach(viewModel.breeds, id: \.id) { breed in
                                    NavigationLink(destination: DetailView(breed: breed)) {
                                        BreedCardView(breed: breed)
                                    }
                                }
                            }
                            .padding()
                        }
                    }
                }
                .foregroundColor(Colors.foreground)
            }
            //  .navigationTitle("Породи котів")
        }
        .onAppear {
            viewModel.fetchBreeds()
        }
    }
}

#Preview {
    HomeView()
}
