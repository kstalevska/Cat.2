//
//  HomeViewModel.swift
//  Cat.2
//
//  Created by Ihor Stalevskiy on 25.03.2025.
//

import Foundation

class HomeViewModel: ObservableObject {
    @Published var breeds: [Breed] = []
    @Published var isLoading = false
    
    private let api = CatAPIService()
    
    func fetchBreeds() {
        //        isLoading = true
        //        Task {
        //            do {
        //                let result = try await api.getBreeds()
        //                DispatchQueue.main.async {
        //                    self.breeds = result
        //                    self.isLoading = false
        //                }
        //            } catch {
        //                print(
        //                    "Помилка завантаження порід: \(error.localizedDescription)")
        //                DispatchQueue.main.async {
        //                    self.isLoading = false
        //                }
        //            }
        //        }
        //    }
//        self.isLoading = false
        self.breeds = Array.mockList
    }
    
}


