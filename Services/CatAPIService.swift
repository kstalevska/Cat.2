//
//  CatAPIService.swift
//  Cat.2
//
//  Created by Ihor Stalevskiy on 25.03.2025.
//

// Відповідає за всі API-запити
import Foundation

final class CatAPIService {

    private let baseURL = "https://api.thecatapi.com/v1"
    private let session: URLSession
    private let apiKey = ""  // якщо потрібен ключ, встав сюди

    init(session: URLSession = .shared) {
        self.session = session
    }

    /// Отримати список порід
    func getBreeds() async throws -> [Breed] {
        guard let url = URL(string: "\(baseURL)/breeds") else {
            throw CatAPIError.invalidURL
        }

        var request = URLRequest(url: url)
        request.httpMethod = "GET"

        // Якщо вимагається API-ключ:
        if !apiKey.isEmpty {
            request.setValue(apiKey, forHTTPHeaderField: "x-api-key")
        }

        let (data, response) = try await session.data(for: request)

        try validate(response: response)

        let breeds = try JSONDecoder().decode([Breed].self, from: data)
        return breeds
    }

    /// Отримати зображення за breedId (опційно)
    func getImage(for breedId: String) async throws -> [BreedsData] {
        guard
            let url = URL(
                string: "\(baseURL)/images/search?breed_ids=\(breedId)")
        else {
            throw CatAPIError.invalidURL
        }

        let (data, response) = try await session.data(from: url)
        try validate(response: response)

        let decoded = try JSONDecoder().decode([BreedsData].self, from: data)
        return decoded
    }

    /// Перевірка статусу відповіді
    private func validate(response: URLResponse) throws {
        guard let httpResponse = response as? HTTPURLResponse else {
            throw CatAPIError.invalidResponse
        }

        guard (200...299).contains(httpResponse.statusCode) else {
            throw CatAPIError.statusCode(httpResponse.statusCode)
        }
    }
}
