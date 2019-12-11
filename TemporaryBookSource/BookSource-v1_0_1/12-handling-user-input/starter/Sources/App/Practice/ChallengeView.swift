import SwiftUI

import Assessing
import Languages
import Learning

/// Displays the challenge information, including question, potential answers, and the score.
struct ChallengeView {
  
  // MARK: - State
  
  /// Our view-backing state model for managing the practice assessment
  /// sessions for the user.
  @ObservedObject private var practiceStore: PracticeStore
  
  // TODO: Manage these conditions in the `PracticeStore` to reduce
  // dependency on `@State` values.
  @State private var isAnswered: Bool = false
  
  @State private var isCorrect: Bool = false
  
  @State private var score: Int = 0
  
  // MARK: - Private Constants
  
  private let onComplete: () -> Void
  
  // MARK: - Private Variables
  
  /// Shortcut to `WordAssessment` within the state-managed `PracticeStore`.
  private var wordAssessment: WordAssessment? {
    practiceStore.assessment
  }
  
  // MARK: - Initializers
  
  /// Initialize a new `ChallengeView`.
  init(onComplete: @escaping () -> Void, practice: PracticeStore) {
    self.onComplete = onComplete
    self.practiceStore = practice
  }
  
  // MARK: - Private Methods
  
  private func answered(_ answer: String) {
    self.isCorrect = self.practiceStore.answer(with: answer)
    self.score = self.practiceStore.score
    self.isAnswered = true
  }
  
  private func challengeOutcomeAlert() -> Alert {
    let alert: Alert
    
    if isCorrect {
      alert = Alert(
        title: Text("Congratulations"),
        message: Text("The answer is correct"),
        dismissButton: Alert.Button.default(Text("OK"), action: {
          
        })
      )
    } else {
      alert = Alert(
        title: Text("Oh no!"),
        message: Text("Your answer is not correct!"),
        dismissButton: Alert.Button.default(Text("OK"), action: {
          
        })
      )
    }
    
    return alert
  }
  
  private func isAnswerCorrect(at index: Int) -> Bool {
    guard let wordAssessment = self.wordAssessment else {
      return false
    }
    
    let answer = wordAssessment.answers[index]
    let challengeSolved: Bool
    
    if wordAssessment.isAnswerCorrect(answer) {
      challengeSolved = true
      practiceStore.saveCorrectAnswer(for: wordAssessment.card)
    } else {
      challengeSolved = false
      practiceStore.saveWrongAnswer(for: wordAssessment.card)
    }
    
    return challengeSolved
  }
}

extension ChallengeView: View {
  
  var body: some View {
    VStack {
      QuestionView(question: wordAssessment?.card.word.original ?? "")
        .frame(height: 300)
      ScoreView(answered: $score, of: self.practiceStore.assessments.count)
      Divider()
      ChoicesView(
        onSelected: answered,
        answers: wordAssessment?.answers ?? [String]()
      )
        .frame(height: 300)
        .padding()
    }
    .alert(isPresented: $isAnswered, content: {
      self.challengeOutcomeAlert()
    })
  }
  
}


#if DEBUG
struct ChallengeView_Previews: PreviewProvider {
  static var previews: some View {
    return ChallengeView(onComplete: {}, practice: PracticeStore())
  }
}

#endif
