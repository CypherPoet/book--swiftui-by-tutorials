import SwiftUI
import Combine

import Assessing
import Languages
import Learning

final internal class PracticeStore {
  
  // MARK: - Constants
  
  let willChange = PassthroughSubject<Void, Never>()
  
  // MARK: - Variables
  var answers: [String] { cards.map { $0.word.translation } }
  
  var assessment: WordAssessment? {
    index < assessments.count ? assessments[index] : nil
  }
  
  var assessments = [WordAssessment]() {
    willSet {
      willChange.send()
    }
  }
  
  @Published var cards = [WordCard]() /* {
   willSet {
   willChange.send()
   }
   }*/
  
  @Published var index: Int = 0
  
  var score: Int {
    return self.assessments.filter {
      $0.card.succeeded
    }.count
  }
  
  var started: Bool {
    assessments.count > 0
  }
  
  var finished: Bool {
    assessments.count > 0 && assessments.count == score
  }
  
  var submissions = [String]() {
    willSet {
      willChange.send()
    }
  }
  
  func isSubmissionCorrect(at index: Int) -> Bool {
    assessments[index].isAnswerCorrect(submissions[index])
  }
  
  // MARK: - Constructors
  
  init() {
    
  }
  
  // MARK: - Public Methods
  
  func assess() -> WordAssessment? {
    return assessments[score]
  }
  
  func build() {
    cards = DeckBuilder.default.build()
    assessments = DeckBuilder.default.assess(upTo: 500)
    submissions = [String](repeating: "", count: assessments.count)
  }
  
  func answer(with answer: String) -> Bool {
    submissions[index] = answer
    
    if assessments[index].card.word.translation == answer {
      assessments[index].card.succeeded = true
      index += 1
      
      return true
    }
    
    return false
  }
  
  func saveCorrectAnswer(for card: WordCard) {
    
  }
  
  func saveWrongAnswer(for card: WordCard) {
    
  }
}
