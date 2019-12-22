//
//  LearningContainerView.swift
//  Kuchi
//
//  Created by CypherPoet on 12/22/19.
// ✌️
//

import SwiftUI


struct LearningContainerView: View {
    private let learningViewModel: LearningViewModel

    
    init(flashCardDeck: FlashCardDeck) {
        self.learningViewModel = LearningViewModel(flashCardDeck: flashCardDeck)
    }
}


// MARK: - Body
extension LearningContainerView {

    var body: some View {
        LearningView(viewModel: self.learningViewModel)
    }
}


// MARK: - Computeds
extension LearningContainerView {
}


// MARK: - View Variables
extension LearningContainerView {


}



// MARK: - Preview
struct LearnContainerView_Previews: PreviewProvider {

    static var previews: some View {
        LearningContainerView(
            flashCardDeck: SampleFlashCardDeck.default
        )
        .environmentObject(SampleStore.withUserProfile)
    }
}
