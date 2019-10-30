//
//  PracticeContainerView.swift
//  Kuchi
//
//  Created by CypherPoet on 10/21/19.
// ✌️
//

import SwiftUI


struct PracticeContainerView: View {
    private var viewModel = ChallengeViewModel()
    
    /// Determines when the practice session has been completed.
    /// Compares the session score with the number of assessments generated.
    @State private var isPracticeComplete: Bool = false
}


// MARK: - Body
extension PracticeContainerView {

    var body: some View {
        ChallengeView(
            viewModel: viewModel,
            onComplete: onChallengeCompleted
        )
        .onAppear(perform: viewModel.startNewChallenge)
        .sheet(
            isPresented: $isPracticeComplete,
            onDismiss: viewModel.startNewChallenge
        ) {
            CongratulationsView()
        }
    }
}


// MARK: - Private Helpers

extension PracticeContainerView {
    
    private func onChallengeCompleted() {
        self.isPracticeComplete = true
    }
}


// MARK: - Preview
struct PracticeContainerView_Previews: PreviewProvider {
    static var previews: some View {
        PracticeContainerView()
    }
}
