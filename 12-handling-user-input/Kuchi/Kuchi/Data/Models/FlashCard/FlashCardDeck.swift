//
//  FlashCardDeck.swift
//  Kuchi
//
//  Created by CypherPoet on 12/22/19.
// ✌️
//

import Combine
import Learning


final class FlashCardDeck {
    @Published var cards: [FlashCard]
    
    
    init(cards: [FlashCard] = []) {
        self.cards = cards
    }
}

extension FlashCardDeck: ObservableObject {}


// MARK: - Convenience Initializers
extension FlashCardDeck {
    
    convenience init(from wordCards: [WordCard]) {
        let flashCards = wordCards.map { FlashCard(wordCard: $0) }
        
        self.init(cards: flashCards)
    }
}


// MARK: - Computeds
extension FlashCardDeck {
    var isEmpty: Bool { cards.isEmpty }
}


// MARK: - Public Helpers
extension FlashCardDeck {
    
    func getNextCard() -> FlashCard? {
        guard !isEmpty else { return nil }
        
        return cards.removeLast()
    }
    
    
    func getLastCard() -> FlashCard? {
        cards.last
    }
}

