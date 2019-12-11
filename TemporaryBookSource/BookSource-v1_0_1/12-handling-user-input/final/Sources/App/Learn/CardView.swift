import SwiftUI

import Languages
import Learning

struct CardView {
  
  private let flashCard: FlashCard

  typealias CardDrag = (_ card: FlashCard, _ direction: DiscardedDirection) -> Void
  private let dragged: CardDrag
  
  @State var offset: CGSize = .zero
  
  @State private var revealed = false
  
  @GestureState var isLongPressed = false
  
  init(_ card: FlashCard, onDrag dragged: @escaping CardDrag = {_,_  in }) {
    self.flashCard = card
    self.dragged = dragged
  }
}

extension CardView: View {
  
  var body: some View {
    let drag = DragGesture()
      .onChanged { self.offset = $0.translation }
      .onEnded {
        if $0.translation.width < -100 {
          self.offset = .init(width: -1000, height: 0)
          self.dragged(self.flashCard, .left)
        } else if $0.translation.width > 100 {
          self.offset = .init(width: 1000, height: 0)
          self.dragged(self.flashCard, .right)
        } else {
          self.offset = .zero
        }
    }
    
    let longPress = LongPressGesture()
      .updating($isLongPressed) { value, state, transition in
            state = value
    }.simultaneously(with: drag)
    
    return ZStack {
      Rectangle()
        .fill(Color.red)
        .frame(width: 320, height: 210)
        .cornerRadius(12)
      VStack {
        Spacer()
        Text(flashCard.card.word.original)
          .font(.largeTitle)
          .foregroundColor(.white)
        if self.revealed {
          Text(flashCard.card.word.translation)
            .font(.caption)
            .foregroundColor(.white)
        }
        Spacer()
      }
    }.shadow(radius: 8)
      .frame(width: 320, height: 210)
      .animation(.spring())
      .offset(self.offset)
      .scaleEffect(isLongPressed ? 1.1 : 1)
      .gesture(longPress)
      .gesture(TapGesture()
        .onEnded {
          withAnimation(.easeIn, {
            self.revealed = !self.revealed
          })
      })
  }
}

struct CardView_Previews: PreviewProvider {
  static var previews: some View {
    let card = FlashCard(card: WordCard(from: TranslatedWord(from: "Apple", withPronunciation: "Apple", andTranslation: "Omena")))
    
    return CardView(card)
  }
}
