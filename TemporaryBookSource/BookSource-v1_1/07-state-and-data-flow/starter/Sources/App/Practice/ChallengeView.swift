/// Copyright (c) 2019 Razeware LLC
///
/// Permission is hereby granted, free of charge, to any person obtaining a copy
/// of this software and associated documentation files (the "Software"), to deal
/// in the Software without restriction, including without limitation the rights
/// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
/// copies of the Software, and to permit persons to whom the Software is
/// furnished to do so, subject to the following conditions:
///
/// The above copyright notice and this permission notice shall be included in
/// all copies or substantial portions of the Software.
///
/// Notwithstanding the foregoing, you may not use, copy, modify, merge, publish,
/// distribute, sublicense, create a derivative work, and/or sell copies of the
/// Software in any work that is designed, intended, or marketed for pedagogical or
/// instructional purposes related to programming, coding, application development,
/// or information technology.  Permission for such use, copying, modification,
/// merger, publication, distribution, sublicensing, creation of derivative works,
/// or sale is expressly withheld.
///
/// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
/// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
/// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
/// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
/// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
/// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
/// THE SOFTWARE.

import SwiftUI

import Assessing
import Languages
import Learning

/// Displays the challenge information, including question, potential answers, and the score.
struct ChallengeView {
  
  // MARK: - State
  
  /// Our view-backing state model for managing the practice assessment
  /// sessions for the user.
  @EnvironmentObject private var practiceStore: PracticeStore
  
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
  init(onComplete: @escaping () -> Void) {
    self.onComplete = onComplete
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
    return ChallengeView(onComplete: {})
  }
}

#endif
