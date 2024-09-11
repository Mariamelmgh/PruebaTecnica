//
//  CardListModule.swift
//  MagicApp
//
//  Created by Mariam El Mgharaz on 10/9/2024.
//

import Foundation

import SwiftUI


struct CardListModule {
    static func build() -> some View {
        let router = CardListRouter()
        let interactor = CardListInteractor()
        let presenter = CardListPresenter(interactor: interactor,router: router)
        return CardListView(presenter: presenter)
    }
}
