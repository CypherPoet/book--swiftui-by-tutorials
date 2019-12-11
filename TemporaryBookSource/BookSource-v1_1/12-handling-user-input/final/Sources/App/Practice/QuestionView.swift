import SwiftUI

/// Displays the original word, or question for the practice session.
struct QuestionView {
  var question: String
}

extension QuestionView: View {
  
  var body: some View {
    HStack {
      Text(question)
        .padding(.horizontal)
        .allowsTightening(true)
        .foregroundColor(.primary)
        .lineLimit(5)
        .multilineTextAlignment(.center)
        .animation(.spring())
    }
  }
  
}

#if DEBUG
struct QuestionView_Previews : PreviewProvider {
  static var previews: some View {
    QuestionView(question: "口")
  }
}
#endif
