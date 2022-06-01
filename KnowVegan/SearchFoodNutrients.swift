//
//  SearchFoodNutrients.swift
//  KnowVegan
//
//  Created by Donovan Z. Jaimes on 31/05/22.
//

import Foundation

struct SearchFoodNutrients: Codable {
    let type: String?
    let nutrient: SearchNutrient
    let amount: Float?


    enum CondingKeys: String, CodingKey{
        case type
        case nutrient
        case amount
    }
    
}
