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
            QuestionView(question: wordAssessment?.card.word.original ?? "")
                .frame(height: 300)

            ScoreView(
                score: viewModel.currentScore,
                maxPossibleScore: viewModel.assessments.count
            )
            
            Divider()
            
            ChoicesView(
                choices: wordAssessment?.answers ?? [String](),
                onSelect: check(selectedAnswer:)
            )
            .frame(height: 300)
            .padding()
        }
    }
}


// MARK: - Private Helpers
extension ChallengeView {
    
    private func check(selectedAnswer: String) {
        
        if viewModel.isFinished {
            onComplete?()
        }
    }
}


// MARK: - Preview
struct ChallengeView_Previews: PreviewProvider {
    
    static var previews: some View {
        let viewModel = ChallengeViewModel()
        viewModel.buildCards()
        
        return ChallengeView(
            viewModel: viewModel,
            onComplete: {}
        )
    }
}
