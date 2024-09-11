//
//  CardDetailModule.swift
//  MagicApp
//
//  Created by Mariam El Mgharaz on 10/9/2024.
//

import Foundation
import SwiftUI


struct CardDetailModule {
    static func build(card: Card) -> some View {
        let router = CardDetailRouter()
        let interactor = CardDetailInteractor()
        let presenter = CardDetailPresenter(card: card, interactor: interactor,router: router)
        return CardDetailView(presenter: presenter)
    }
}
