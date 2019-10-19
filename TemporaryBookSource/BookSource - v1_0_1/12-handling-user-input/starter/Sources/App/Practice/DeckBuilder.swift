import Foundation

import Assessing
import Learning

final class DeckBuilder {
  
  // MARK: - Static variables
  
  static var `default` = DeckBuilder()
  
  static var `learning` = DeckBuilder()
  
  // MARK: - Variables
  
  var answers: [String] { return cards.map { $0.word.translation }}
  
  var cards = [WordCard]()
  
  // MARK: - Initializers
  
  private init() { }
  
  // MARK: - Methods
  
  func build() -> [WordCard] {
    self.cards = [WordCard]()
    
    if let words = LanguageLoader.loadTranslatedWords(from: "jp") {
      words.forEach { word in
        cards.append(WordCard(from: word))
      }
    }
    
    return self.cards
  }
  
  func assess(upTo count: Int) -> [WordAssessment] {
    let cards = self.cards.filter { $0.completed == false }
    var randomCards: Set<WordCard>
    
    // If there are not enough cards, return them all
    
    if cards.count < count {
      randomCards = Set(cards)
    } else {
      randomCards = Set()
      while randomCards.count < count {
        guard let randomCard = cards.randomElement() else { continue }
        randomCards.insert(randomCard)
      }
    }
    
    let tests = randomCards.map({
      WordAssessment(
        card: $0,
        answers: getRandomAnswers(count: 3, including: $0.word.translation)
      )
    })
    
    return tests.shuffled()
  }
  
  // MARK: - Private Methods
  
  private func getRandomAnswers(count: Int, including includedAnswer: String) -> [String] {
    let answers = self.answers
    
    // If there are not enough answers, return them all
    guard count < answers.count else {
      return answers.shuffled()
    }
    
    var randomAnswers = Set<String>()
    randomAnswers.insert(includedAnswer)
    while randomAnswers.count < count {
      guard let randomAnswer = answers.randomElement() else { continue }
      randomAnswers.insert(randomAnswer)
    }
    
    return Array(randomAnswers).shuffled()
  }
}
