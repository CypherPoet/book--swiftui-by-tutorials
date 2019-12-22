//
//  FlashCardDeckView.swift
//  Kuchi
//
//  Created by CypherPoet on 12/22/19.
// ✌️
//

import SwiftUI


struct FlashCardDeckView: View {
    let cards: [FlashCard]
    let onMemorized: ((FlashCard) -> Void)
}


// MARK: - Body
extension FlashCardDeckView {

    var body: some View {
        ZStack {
            ForEach(cards) { card in
                FlashCardView(
                    viewModel: .init(flashCard: card),
                    onDrag: self.flashCardDragged(card:direction:)
                )
            }
        }
    }
}


// MARK: - Computeds
extension FlashCardDeckView {
}


// MARK: - View Variables
extension FlashCardDeckView {
}


// MARK: - Private Helpers
private extension FlashCardDeckView {
    
    func flashCardDragged(card: FlashCard, direction: CardDragDirection) {
        if direction == .left {
            self.onMemorized(card)
        }
    }
}


// MARK: - Preview
struct FlashCardDeckView_Previews: PreviewProvider {

    static var previews: some View {
        FlashCardDeckView(
            cards: SampleFlashCardDeck.default.cards,
            onMemorized: { _ in }
        )
    }
}


