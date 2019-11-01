//
//  ChallengeView.swift
//  Kuchi
//
//  Created by CypherPoet on 10/21/19.
// ✌️
//

import SwiftUI
import Assessing
import Languages
import Learning


struct ChallengeView: View {
    @ObservedObject private(set) var viewModel: ChallengeViewModel

    let onComplete: (() -> Void)?

    @State private var isShowingAnswers = false
    @State private var isShowingAnswerAlert = false
}


// MARK: - Computeds
extension ChallengeView {
    
    /// Shortcut to `WordAssessment` within the state-managed `ChallengeViewModel`.
    private var wordAssessment: WordAssessment? { viewModel.currentAssessment }
}


// MARK: - Body
extension ChallengeView {

    var body: some View {
        VStack {
            Button(action: {
                self.isShowingAnswers.toggle()
            }) {
                QuestionView(question: wordAssessment?.card.word.original ?? "")
                    .frame(height: 300)
            }

//            ScoreView(
//                score: viewModel.currentScore,
//                maxPossibleScore: viewModel.assessments.count
//            )
            
            if isShowingAnswers {
                Divider()

                ChoicesView(
                    choices: wordAssessment?.answers ?? [String](),
                    onSelect: check(selectedAnswer:)
                )
                .frame(height: 300)
                .clipped()
                .padding()
            }
        }
        .alert(isPresented: $isShowingAnswerAlert) {
            Alert(
                title: Text(viewModel.wasPreviousAnswerCorrect ? "Correct" : "Incorrect"),
                message: Text(viewModel.answerAlertMessage),
                dismissButton: .default(Text("OK"), action: {
                    if self.viewModel.isFinished {
                        self.onComplete?()
                    } else {
                        self.viewModel.buildCards()
                    }
                })
            )
        }
    }
}


// MARK: - Private Helpers
extension ChallengeView {
    
    private func check(selectedAnswer: String) {
        let isCorrect = viewModel.answer(with: selectedAnswer)
        
        isShowingAnswerAlert = true
    }
}


// MARK: - Preview
struct ChallengeView_Previews: PreviewProvider {
    
    static var previews: some View {
        let viewModel = ChallengeViewModel()
        viewModel.startNewChallenge()
        
        return ChallengeView(
            viewModel: viewModel,
            onComplete: {}
        )
    }
}
