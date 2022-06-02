//
//  FruitNutrients.swift
//  KnowVegan
//
//  Created by Luis Fernando Cuevas Cuauhtle on 2/6/22.
//

import Foundation

struct FruitNutrients: Codable {
    
    let nutrient: Nutrient
    let type: String
    let id: Int?
    let amount: Float?
    
    enum CodingKeys: String,CodingKey {
        case nutrient
        case type
        case id
        case amount
    }
    
}
