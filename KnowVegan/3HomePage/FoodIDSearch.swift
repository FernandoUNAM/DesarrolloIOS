//
//  FoodIDSearch.swift
//  KnowVegan
//
//  Created by Luis Fernando Cuevas Cuauhtle on 2/6/22.
//

import Foundation

struct FoodIDSearch: Codable{
    
    let fdcId: Int
    let description: String
    let publicationDate: String
    let foodNutrients: [FruitNutrients]
    
    enum CodingKeys: String,CodingKey {
        
        case fdcId
        case description
        case publicationDate
        case foodNutrients
        
    }
    
}
