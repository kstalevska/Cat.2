//
//  BreedsData.swift
//  Cat.2
//
//  Created by Ihor Stalevskiy on 25.03.2025.
//

import Foundation
//Обгортка відповіді

struct BreedsData: Codable {
    let id: String
    let url: String
    let breeds: [Breed]
    let width, height: Int
}
