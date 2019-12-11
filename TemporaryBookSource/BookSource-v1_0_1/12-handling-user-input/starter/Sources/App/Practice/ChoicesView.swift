import SwiftUI

import Assessing
import Learning

/// Displays the view for the choices available for the practice
/// question.
struct ChoicesView {
  
  // MARK: - Private Constants
  
  private let answer: (_ answer: String) -> Void
  
  private let answers: [String]
  
  // MARK: - Initializers
  
  init(onSelected action: @escaping (_ answer: String) -> Void, answers: [String]) {
    self.answer = action
    self.answers = answers
  }
  
}

extension ChoicesView: View {
  
  var body: some View {
    VStack(spacing: 25) {
      ForEach(0 ..< self.answers.count) { index in
        Button(action: {
          self.answer(self.answers[index])
        }, label: {
          Text(self.answers[index])
            .font(.title)
        })
        Divider()
      }
    }
  }
  
}

#if DEBUG
struct ChoicesView_Previews : PreviewProvider {
  static var previews: some View {
    ChoicesView(onSelected: {_ in }, answers: [String]())
  }
}
#endif
