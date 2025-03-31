//
//  CatAPIError.swift
//  Cat.2
//
//  Created by Ihor Stalevskiy on 25.03.2025.
//

import Foundation

enum CatAPIError: Error, LocalizedError {
    case invalidURL
    case invalidResponse
    case statusCode(Int)
    case decodingError

    var errorDescription: String? {
        switch self {
        case .invalidURL:
            return "Неправильна URL-адреса"
        case .invalidResponse:
            return "Некоректна відповідь сервера"
        case .statusCode(let code):
            return "Помилка сервера: \(code)"
        case .decodingError:
            return "Помилка при декодуванні даних"
        }
    }
}
