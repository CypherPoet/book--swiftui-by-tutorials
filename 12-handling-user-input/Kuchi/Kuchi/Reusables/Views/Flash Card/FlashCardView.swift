//
//  FlashCardView.swift
//  Kuchi
//
//  Created by CypherPoet on 12/22/19.
// ✌️
//

import SwiftUI


struct FlashCardView: View {
    typealias CardDrag = (_ card: FlashCard, _ direction: CardDragDirection) -> Void
    
    var viewModel: ViewModel
    let onDrag: CardDrag
    var dragThreshold: CGFloat = 150.0
    
    @State private var isAnswerRevealed = false
    @State private var dragOffset: CGSize = .zero
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
        .offset(dragOffset)
        .gesture(tapGesture)
        .gesture(dragGesture)
        .animation(.spring())
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
    
    
    private var dragGesture: some Gesture {
        DragGesture()
            .onChanged { dragValue in
                self.dragOffset = dragValue.translation
            }
        .onEnded { dragValue in
            if dragValue.translation.width < -self.dragThreshold {
                self.swipeLeft()
            } else if dragValue.translation.width > self.dragThreshold {
                self.swipeRight()
            } else {
                self.dragOffset = .zero
            }
        }
    }
}


// MARK: - Private Helpers
private extension FlashCardView {
    
    func swipeLeft() {
        self.dragOffset = .init(width: -1000, height: 0)
        self.onDrag(viewModel.flashCard, .left)
    }
    
    func swipeRight() {
        self.dragOffset = .init(width: 1000, height: 0)
        self.onDrag(viewModel.flashCard, .right)
    }
}


// MARK: - Preview
struct FlashCardView_Previews: PreviewProvider {

    static var previews: some View {
        FlashCardView(
            viewModel: .init(flashCard: SampleFlashCard.default),
            onDrag: { (_, _) in }
        )
    }
}
