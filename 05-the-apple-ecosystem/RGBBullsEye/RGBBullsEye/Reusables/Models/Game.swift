//
//  Game.swift
//  RGBBullsEye
//
//  Created by Brian Sipple on 10/11/19.
//  Copyright © 2019 CypherPoet. All rights reserved.
//

import Foundation
import SwiftUI
import Combine


final class Game: ObservableObject {
    @Published var currentRound: Int = -1
    @Published var scoreForRound: Int = 0
    @Published var totalScore: Int = 0
    
    @Published var targetRed: Double = -1
    @Published var targetGreen: Double = -1
    @Published var targetBlue: Double = -1
    
    
    init() {
        startNewGame()
    }
}


extension Game {
    var targetColor: Color { .init(red: targetRed, green: targetGreen, blue: targetBlue) }
}


extension Game {
    typealias Answer = (red: Double, green: Double, blue: Double)
    
    
    func startNewGame() {
        currentRound = 0
        totalScore = 0
        
        startNewRound()
    }
    
    
    func startNewRound() {
        scoreForRound = 0
        currentRound += 1
        
        targetRed = Double.random(in: 0..<1)
        targetGreen = Double.random(in: 0..<1)
        targetBlue = Double.random(in: 0..<1)
    }
    
    
    func check(guess answer: Answer) {
        scoreForRound = computeScore(for: answer)
    }
    
    
    func computeScore(for answer: Answer) -> Int {
        let redDiff = targetRed - answer.red
        let greenDiff = targetGreen - answer.green
        let blueDiff = targetBlue - answer.blue
        
        let diff = sqrt((redDiff * redDiff) + (greenDiff * greenDiff) + (blueDiff * blueDiff))
        
        return Int( ((1.0 - diff) * 100.0) + 0.5)
    }
}
