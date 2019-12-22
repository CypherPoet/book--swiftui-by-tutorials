//
//  ChallengeViewModel.swift
//  Kuchi
//
//  Created by CypherPoet on 10/21/19.
// ✌️
//

import SwiftUI
import Combine
import Assessing
import Languages
import Learning


final class ChallengeViewModel: ObservableObject {
    enum ChallengeState {
        case notStarted
        case inProgress(currentIndex: Int)
        case finished
    }
    
    
    @Published var assessments: [WordAssessment] = [] {
        didSet {
            if
                !assessments.isEmpty &&
                assessments.allSatisfy({ $0.card.succeeded == true })
            {
                challengeState = .finished
            }
        }
    }
    
    @Published var cards: [WordCard] = []
    @Published var challengeState: ChallengeState = .notStarted
    @Published var submissions: [String] = []
    
    @Published var wasPreviousAnswerCorrect: Bool = false
    @Published var answerAlertMessage: String = ""
}


// MARK: - Computeds
extension ChallengeViewModel {
    var answers: [String] { cards.map { $0.word.translation } }
    
    var currentIndex: Int {
        switch challengeState {
        case .inProgress(let currentIndex):
            return currentIndex
        case .notStarted, .finished:
            return 0
        }
    }
    
    
    var currentScore: Int {
        assessments
            .filter { $0.card.succeeded }
            .count
    }
    
    
    var currentAssessment: WordAssessment? {
        if case let .inProgress(currentIndex) = challengeState {
            return assessments[currentIndex]
        } else {
            return nil
        }
    }
    
    
    var isStarted: Bool {
        if case .inProgress = challengeState {
            return true
        } else {
            return false
        }
    }
    
    
    var isFinished: Bool {
        if case .finished = challengeState {
            return true
        } else {
            return false
        }
    }
}


// MARK: - Public Methods
extension ChallengeViewModel {
    
    func startNewChallenge() {
        challengeState = .inProgress(currentIndex: 0)
        buildCards()
    }
    
    
    func isSubmissionCorrect(at index: Int) -> Bool {
        assessments[index].isAnswerCorrect(submissions[index])
    }
    

    func assess() -> WordAssessment? {
        return assessments[currentScore]
    }
    
    
    func buildCards() {
        cards = DeckBuilder.default.build()
        assessments = DeckBuilder.default.assess(upTo: 500)
        submissions = [String](repeating: "", count: assessments.count)
    }
    
    
    func answer(with answer: String) -> Bool {
        submissions[currentIndex] = answer
        
        if assessments[currentIndex].card.word.translation == answer {
            assessments[currentIndex].card.succeeded = true
            challengeState = .inProgress(currentIndex: currentIndex + 1)
            
            answerAlertMessage = "You guessed correctly!"
            return true
        }
        
        answerAlertMessage = "Sorry, that's incorrect."
        return false
    }
    
    
    func saveCorrectAnswer(for card: WordCard) {
        
    }
    
    
    func saveWrongAnswer(for card: WordCard) {
        
    }
}
