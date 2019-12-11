import Combine
import Learning

final internal class FlashDeck {
  
  @Published var cards: [FlashCard]
  
  init(from words: [WordCard]) {
    self.cards = words.map {
      FlashCard(card: $0)
    }
  }
}
