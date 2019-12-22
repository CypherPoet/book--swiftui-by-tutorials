//
//  FlashCardDeck.swift
//  Kuchi
//
//  Created by CypherPoet on 12/22/19.
// ✌️
//

#if DEBUG

import Foundation
import Learning
import Languages


enum SampleFlashCardDeck {
    static let `default` = FlashCardDeck(from: DeckBuilder.default.build())
}



enum SampleFlashCard {
    static let `default` = FlashCard(wordCard: SampleWordCard.apple)
}


enum SampleWordCard {
    static let apple = WordCard(
        from: TranslatedWord(
            from: "Apple",
            withPronunciation: "Apple",
            andTranslation: "Omena"
        )
    )
}

#endif
