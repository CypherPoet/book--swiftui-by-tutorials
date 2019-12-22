//
//  FlashCardView.swift
//  Kuchi
//
//  Created by CypherPoet on 12/22/19.
// ✌️
//

import SwiftUI


struct FlashCardView: View {
    var viewModel: ViewModel
    
    @State private var isAnswerRevealed = false
}


// MARK: - Body
extension FlashCardView {

    var body: some View {
        VStack(spacing: 12.0) {
            Text(viewModel.startingText)
                .font(.largeTitle)
            
            if isAnswerRevealed {
                Text(viewModel.answerText)
                    .font(.caption)
            }
        }
        .foregroundColor(.white)
        .frame(width: 320, height: 210)
        .background(cardBackground)
        .animation(.spring())
        .gesture(tapGesture)
    }
}


// MARK: - Computeds
extension FlashCardView {
}


// MARK: - View Variables
extension FlashCardView {

    private var cardBackground: some View {
        RoundedRectangle(cornerRadius: 12)
            .fill(Color.purple)
            .shadow(color: .gray, radius: 8, x: 0, y: 0)
    }
    
    
    private var tapGesture: some Gesture {
        TapGesture()
            .onEnded { _ in
                withAnimation(
                    Animation.easeIn(duration: 0.4),
                    {
                        self.isAnswerRevealed.toggle()
                    }
                )
            }
    }
}



// MARK: - Preview
struct FlashCardView_Previews: PreviewProvider {

    static var previews: some View {
        FlashCardView(
            viewModel: .init(flashCard: SampleFlashCard.default)
        )
    }
}


extension FlashCardView {
    
    struct ViewModel {
        var flashCard: FlashCard
    }
}


extension FlashCardView.ViewModel {
    var startingText: String { flashCard.wordCard.word.original }
    var answerText: String { flashCard.wordCard.word.translation }
}
