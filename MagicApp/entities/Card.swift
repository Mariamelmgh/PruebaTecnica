//
//  Card.swift
//  MagicApp
//
//  Created by Mariam El Mgharaz on 10/9/2024.
//

import Foundation

struct CardResponse: Codable {
    let cards: [Card]
}
struct Card: Codable, Identifiable {
    let id: String
    let name: String
    let text: String
    let imageUrl:String?
    
   
   
}
