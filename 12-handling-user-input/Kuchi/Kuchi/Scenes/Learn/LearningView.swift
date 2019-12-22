//
//  LearningView.swift
//  Kuchi
//
//  Created by CypherPoet on 12/22/19.
// ✌️
//

import SwiftUI


struct LearningView: View {
    @ObservedObject var viewModel: LearningViewModel
}


// MARK: - Body
extension LearningView {

    var body: some View {
        VStack(spacing: 16) {
            Spacer()
            
            VStack(alignment: .leading, spacing: 4) {
                Text("Swipe left if you remembered.")
                Text("Swipe right if you didn't.")
            }
            .font(.headline)
            
            FlashCardDeckView(
                cards: viewModel.activeCards,
                onMemorized: { _ in self.viewModel.currentScore += 1 }
            )
            
            
            Spacer()
            
            Text("Remembered: \(viewModel.currentScore)/\(viewModel.cardCount)")
        }
    }
}


// MARK: - Computeds
extension LearningView {


}


// MARK: - View Variables
extension LearningView {


}



// MARK: - Preview
struct LearningView_Previews: PreviewProvider {

    static var previews: some View {
        LearningView(
            viewModel: LearningViewModel(flashCardDeck: SampleFlashCardDeck.default)
        )
    }
}
