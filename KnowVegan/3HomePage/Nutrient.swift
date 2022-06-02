//
//  Nutrient.swift
//  KnowVegan
//
//  Created by Luis Fernando Cuevas Cuauhtle on 2/6/22.
//

import Foundation

struct Nutrient: Codable{
    
    let id: Int
    let number: String
    let name: String
    let rank: Int
    let unitName: String
    
    enum CodingKeys: String,CodingKey {
        
        case id
        case number
        case name
        case rank
        case unitName
        
    }
    
}
