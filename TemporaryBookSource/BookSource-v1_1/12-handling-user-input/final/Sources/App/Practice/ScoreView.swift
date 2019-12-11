import Combine
import SwiftUI

struct ScoreView {
  
  @Binding private var answered: Int
  
  private let questions: Int
  
  init(answered: Binding<Int>, of questions: Int) {
    self._answered = answered
    self.questions = questions
  }
}

extension ScoreView: View {
  
  var body: some View {
    HStack {
      Text("\(answered)/\(questions)")
        .font(.caption)
        .padding(4)
      Spacer()
    }
  }
  
}

#if DEBUG
struct ScoreView_Previews: PreviewProvider {
  @State static private var score = 42
  
  static var previews: some View {
    return ScoreView(answered: $score, of: 500)
  }
}
#endif
