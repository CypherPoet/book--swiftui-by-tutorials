import SwiftUI
import Languages

struct LearnView {  
  @ObservedObject private var learningStore = LearningStore()
  
  init() {}
}

extension LearnView: View {
  var body: some View {
    VStack {
      Spacer()
      Text("Swipe left if you remembered\nSwipe right if you didn't")
        .font(.headline)
      DeckView(onMemorized: {
        self.learningStore.score += 1
      }, deck: learningStore.deck)
      Spacer()
      Text("Remembered \(self.learningStore.score)/\(self.learningStore.deck.cards.count)")
    }
  }
}

struct LearnView_Previews: PreviewProvider {
  static var previews: some View {
    LearnView()
  }
}
