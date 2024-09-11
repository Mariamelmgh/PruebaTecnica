//
//  CardDetailPresenter.swift
//  MagicApp
//
//  Created by Mariam El Mgharaz on 11/9/2024.
//

import Foundation
import SwiftUI

class CardDetailPresenter: ObservableObject {
    @Published var card: Card
    private var interactor: CardDetailInteractorInput
    private var router: CardDetailRouter?

    init(card: Card, interactor: CardDetailInteractorInput, router: CardDetailRouter? = nil) {
        self.card = card
        self.interactor = interactor
        self.router = router
    }

    func fetchCardDetails() {
        interactor.fetchCardDetails(for: card)
    }
}

protocol CardDetailPresenterOutput: AnyObject {
    func didFetchCardDetails(card: Card)
}
