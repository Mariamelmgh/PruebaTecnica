//
//  MockCard.swift
//  MagicAppTests
//
//  Created by Mariam El Mgharaz on 12/9/2024.
//

import Foundation

struct MockCard: Codable, Equatable {
    let id: String
    let name: String
    let text: String
    let imageUrl:String?
}
struct MockCardResponse: Codable {
    let cards: [MockCard]
}
