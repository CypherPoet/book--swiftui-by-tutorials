//
//  LearningState.swift
//  Kuchi
//
//  Created by CypherPoet on 12/22/19.
// ✌️
//

import Foundation
import Combine
import CypherPoetSwiftUIKit_DataFlowUtils


struct LearningState {
    var flashCardDeck: FlashCardDeck
    
    
    init() {
        self.flashCardDeck = .init(from: DeckBuilder.learning.build())
    }
}



//enum LearningSideEffect: SideEffect {
//
//}



enum LearningAction {
    case flashCardDeckSet(FlashCardDeck)
}


// MARK: - Reducer
let learningReducer: Reducer<LearningState, LearningAction> = Reducer(
    reduce: { state, action in
        switch action {
        case .flashCardDeckSet(let flashCardDeck):
            state.flashCardDeck = flashCardDeck
        }
    }
)

