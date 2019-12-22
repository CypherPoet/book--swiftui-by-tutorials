//
//  LearningViewModel.swift
//  Kuchi
//
//  Created by CypherPoet on 12/22/19.
// ✌️
//


import SwiftUI
import Combine


final class LearningViewModel: ObservableObject {
    private var subscriptions = Set<AnyCancellable>()


    // MARK: - Published Properties
    @Published var flashCardDeck: FlashCardDeck
    @Published var activeCards: [FlashCard] = []
    @Published var currentCard: FlashCard
    @Published var currentScore: Int = 0


    // MARK: - Init
    init(
        flashCardDeck: FlashCardDeck
    ) {
        self.flashCardDeck = flashCardDeck
        
        guard let nextCard = flashCardDeck.getNextCard() else {
            fatalError("Attempted to initialize learning view with an empty deck.")
        }
        
        self.currentCard = nextCard
        
        setupSubscribers()
    }
}


// MARK: - Publishers
extension LearningViewModel {
    
    private var activeCardsPublisher: AnyPublisher<[FlashCard], Never> {
        CurrentValueSubject(flashCardDeck.cards)
//            .print("activeCardsPublisher")
            .map { cards in cards.filter { $0.isActive } }
            .eraseToAnyPublisher()
    }
}


// MARK: - Computeds
extension LearningViewModel {
    var cardCount: Int { flashCardDeck.cards.count }
}


// MARK: - Public Methods
extension LearningViewModel {
}



// MARK: - Private Helpers
private extension LearningViewModel {

    func setupSubscribers() {
        activeCardsPublisher
            .receive(on: DispatchQueue.main)
            .assign(to: \.activeCards, on: self)
            .store(in: &subscriptions)
    }
}
