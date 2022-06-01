//
//  SearchUSDA.swift
//  KnowVegan
//
//  Created by Donovan Z. Jaimes on 31/05/22.
//

import Foundation

struct SearchGeneral: Codable {
    let description: String
    let foodNutrients: [SearchFoodNutrients]
    


    enum CondingKeys: String, CodingKey{
        case description
        case foodNutrients
    }
    
}
