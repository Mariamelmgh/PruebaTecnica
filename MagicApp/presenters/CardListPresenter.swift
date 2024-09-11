//
//  CardListPresenter.swift
//  MagicApp
//
//  Created by Mariam El Mgharaz on 10/9/2024.
//

import Foundation
import SwiftUI

class CardListPresenter: ObservableObject {
    @Published var cards: [Card] = []
    @Published var isLoading: Bool = false
    @Published var errorMessage: String? = nil
    
    private let interactor: CardListInteractor
    private let router: CardListRouter
    
    init(interactor: CardListInteractor, router: CardListRouter) {
        self.interactor = interactor
        self.router = router
    }
    
    // Load cards from the interactor
    func loadCards() {
        isLoading = true
        errorMessage = nil
        interactor.fetchCards { [weak self] result in
            DispatchQueue.main.async {
                self?.isLoading = false
                switch result {
                case .success(let cards):
                    self?.cards = cards
                case .failure(let error):
                    self?.errorMessage = error.localizedDescription
                    
                }
                
            }
           
        }
    }
        // Handle card selection
        func didSelectCard(_ card: Card) -> some View{
            return router.navigateToCardDetail(for: card)
        }
    }


