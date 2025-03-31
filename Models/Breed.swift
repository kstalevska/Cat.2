//
//  Breed.swift
//  Cat.2
//
//  Created by Ihor Stalevskiy on 25.03.2025.
//

import Foundation

//Codable модель породи

struct Breed: Codable {
    let weight: Weight
    let id, name: String
    let cfaURL: String
    
    let temperament, origin: String
  
    let description: String
    let lifeSpan: String
    
    let wikipediaURL: String
    
    let referenceImageID: String

    enum CodingKeys: String, CodingKey {
        case weight, id, name
        case cfaURL = "cfa_url"
        //        case vetstreetURL = "vetstreet_url"
        //        case vcahospitalsURL = "vcahospitals_url"
        case temperament, origin
        //        case countryCodes = "country_codes"
        //        case countryCode = "country_code"
        case description
        case lifeSpan = "life_span"
        //        case indoor, lap
        //        case altNames = "alt_names"
        //        case adaptability
        //        case affectionLevel = "affection_level"
        //        case childFriendly = "child_friendly"
        //        case dogFriendly = "dog_friendly"
        //        case energyLevel = "energy_level"
        //        case grooming
        //        case healthIssues = "health_issues"
        //        case intelligence
        //        case sheddingLevel = "shedding_level"
        //        case socialNeeds = "social_needs"
        //        case strangerFriendly = "stranger_friendly"
        //        case vocalisation, experimental, hairless, natural, rare, rex
        //        case suppressedTail = "suppressed_tail"
        //        case shortLegs = "short_legs"
        case wikipediaURL = "wikipedia_url"
        //       case hypoallergenic
        case referenceImageID = "reference_image_id"
    }
}

