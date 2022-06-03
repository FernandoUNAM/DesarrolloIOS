//
//  FoodSearch.swift
//  KnowVegan
//
//  Created by Donovan Z. Jaimes on 02/06/22.
//

import Foundation
struct FoodSearch: Codable {
    let totalHits: Int
    //let foods: [SearchFoods]?
    let foods: [SearchFoods]


    enum CondingKeys: String, CodingKey{
        case totalHits
        case foods
    }
    
}
