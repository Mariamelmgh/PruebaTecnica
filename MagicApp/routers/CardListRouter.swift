//
//  CardListRouter.swift
//  MagicApp
//
//  Created by Mariam El Mgharaz on 10/9/2024.
//

import SwiftUI

class CardListRouter {
    func navigateToCardDetail(for card: Card) -> some View {
        return CardDetailModule.build(card: card)
    }
}
