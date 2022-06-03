//
//  SearchFoods.swift
//  KnowVegan
//
//  Created by Donovan Z. Jaimes on 02/06/22.
//

import Foundation

struct SearchFoods: Codable {
    let fdcId: Int
    let description: String?
    let foodCategory: String?
    


    enum CondingKeys: String, CodingKey{
        case fdcId
        case description
        case foodCategory
    }
    
}
