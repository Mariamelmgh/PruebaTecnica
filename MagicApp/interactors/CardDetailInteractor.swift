//
//  CardDetailInteractor.swift
//  MagicApp
//
//  Created by Mariam El Mgharaz on 11/9/2024.
//

import Foundation

class CardDetailInteractor: CardDetailInteractorInput {
    weak var output: CardDetailPresenterOutput?

    func fetchCardDetails(for card: Card) {
         output?.didFetchCardDetails(card: card)
    }
}

protocol CardDetailInteractorInput {
    func fetchCardDetails(for card: Card)
}
