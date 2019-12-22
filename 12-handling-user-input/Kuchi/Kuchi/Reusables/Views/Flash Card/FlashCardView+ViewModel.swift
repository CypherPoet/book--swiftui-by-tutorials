//
//  FlashCardView+ViewModel.swift
//  Kuchi
//
//  Created by CypherPoet on 12/22/19.
// ✌️
//

import Foundation


extension FlashCardView {
    
    struct ViewModel {
        var flashCard: FlashCard
    }
}


extension FlashCardView.ViewModel {
    var startingText: String { flashCard.wordCard.word.original }
    var answerText: String { flashCard.wordCard.word.translation }
}

