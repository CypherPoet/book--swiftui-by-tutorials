//
//  FlashCard.swift
//  Kuchi
//
//  Created by CypherPoet on 12/22/19.
// ✌️
//

import SwiftUI
import Learning


struct FlashCard {
    let id = UUID()
    
    var wordCard: WordCard
    var isActive: Bool = true
}


extension FlashCard: Identifiable {}

