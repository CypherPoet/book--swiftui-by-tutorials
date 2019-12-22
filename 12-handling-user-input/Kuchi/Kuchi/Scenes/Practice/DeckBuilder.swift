//
//  DeckBuilder.swift
//  Kuchi
//
//  Created by CypherPoet on 10/22/19.
// ✌️
//

import Foundation

import Assessing
import Learning
import Languages
import CypherPoetCore_FileSystem


final class DeckBuilder {
    static var `default` = DeckBuilder()
    static var `learning` = DeckBuilder()

    
    var cards = [WordCard]()
    var answers: [String] { return cards.map { $0.word.translation }}
}


// MARK: - Public Methods
extension DeckBuilder {
    
    func build() -> [WordCard] {
        self.cards = []
        
        if let translatedWords: [TranslatedWord] = try? Bundle.main.decodeJSON(
            fromFileNamed: "jp"
        ) {
            self.cards = translatedWords.map { WordCard(from: $0) }
        }
        
        return self.cards
    }
    
    
    func assess(upTo count: Int) -> [WordAssessment] {
        let incompleteCards = self.cards.filter { $0.completed == false }
        var randomCards: Set<WordCard>
        
        // If there are not enough cards, return them all
        if incompleteCards.count < count {
            randomCards = Set(incompleteCards)
        } else {
            randomCards = Set()
            while randomCards.count < count {
                guard let randomCard = cards.randomElement() else { continue }
                randomCards.insert(randomCard)
            }
        }
        
        let tests = randomCards.map {
            WordAssessment(
                card: $0,
                answers: getRandomAnswers(count: 3, including: $0.word.translation)
            )
        }
        
        return tests.shuffled()
    }
}


// MARK: - Private Helpers
extension DeckBuilder {
    
    private func getRandomAnswers(count: Int, including includedAnswer: String) -> [String] {
        // If there are not enough answers, return them all
        guard count > answers.count else { return answers.shuffled() }
        
        var results = Set<String>([includedAnswer])
        
        while results.count < count {
            guard let answer = answers.randomElement() else { continue }
            results.insert(answer)
        }
        
        return results.shuffled()
    }
}


