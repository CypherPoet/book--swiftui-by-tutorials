//
//  FlashCard+Equatable.swift
//  Kuchi
//
//  Created by CypherPoet on 12/22/19.
// ✌️
//

import SwiftUI


extension FlashCard: Equatable {
    
    static func == (lhs: FlashCard, rhs: FlashCard) -> Bool {
        lhs.wordCard.word.original == rhs.wordCard.word.original &&
        lhs.wordCard.word.translation == rhs.wordCard.word.translation
    }
}
