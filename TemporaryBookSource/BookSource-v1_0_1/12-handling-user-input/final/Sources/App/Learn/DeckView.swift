import Combine
import SwiftUI

struct DeckView {
  
  @ObservedObject private var deck: FlashDeck
  
  private let onMemorized: () -> Void
  
  init(onMemorized: @escaping () -> Void, deck: FlashDeck) {
    self.onMemorized = onMemorized
    self.deck = deck
  }
  
  func getCardView(for card: FlashCard) -> CardView {
    let activeCards = deck.cards.filter { $0.isActive == true }
    if let lastCard = activeCards.last {
      if lastCard == card {
        return createCardView(for: card)
      }
    }
    
    let view = createCardView(for: card)
    
    return view
  }

  func createCardView(for card: FlashCard) -> CardView {
    let view = CardView(card, onDrag: { card, direction in
      if direction == .left {
        self.onMemorized()
      }
    })
    
    return view
  }
}

extension DeckView: View {
  var body: some View {
    ZStack {
      ForEach(deck.cards.filter { $0.isActive }) { card in
        self.getCardView(for: card)
      }
    }
  }
}

struct DeckView_Previews: PreviewProvider {
  static var previews: some View {
    DeckView(onMemorized: {}, deck: LearningStore().deck)
  }
}
