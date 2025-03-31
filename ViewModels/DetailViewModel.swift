//
//  DetailViewModel.swift
//  Cat.2
//
//  Created by Ihor Stalevskiy on 25.03.2025.
//

//Може обробляти дані однієї породи
import Foundation
import SwiftUI

@MainActor
class DetailViewModel: ObservableObject {
    @Published var breed: Breed
    @Published var imageURL: URL?
    @Published var isLoading = false
    @Published var errorMessage: String?

    private let apiService = CatAPIService()

    init(breed: Breed) {
        self.breed = breed
    }

    func fetchBreedImage() async {
        isLoading = true
        errorMessage = nil

        do {
            let result = try await apiService.getImage(for: breed.id)
            if let first = result.first {
                self.imageURL = URL(string: first.url)
            } else {
                self.errorMessage = "Зображення не знайдено"
            }
        } catch {
            self.errorMessage = error.localizedDescription
        }

        isLoading = false
    }
}


