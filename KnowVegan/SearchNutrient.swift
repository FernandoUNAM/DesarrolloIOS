//
//  SearchNutrient.swift
//  KnowVegan
//
//  Created by Donovan Z. Jaimes on 31/05/22.
//

import Foundation

struct SearchNutrient: Codable {
    let name: String
    let unitName: String
    


    enum CondingKeys: String, CodingKey{
        case name
        case unitName
    }
    
}
