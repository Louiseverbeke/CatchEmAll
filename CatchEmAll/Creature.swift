//
//  Creature.swift
//  CatchEmAll
//
//  Created by Louise Verbeke on 23/03/2026.
//

import Foundation

struct Creature: Codable, Identifiable {
    let id = UUID().uuidString
    
    var name: String
    var url: String
    
    enum CodingKeys: String, CodingKey {
        case name
        case url
    }
}
