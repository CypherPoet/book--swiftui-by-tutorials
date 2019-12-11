import SwiftUI

import Assessing
import Languages
import Learning

/// Displays the practice view with question and potential answers (choices).
struct PracticeView {
  
  private let practiceStore: PracticeStore
  
  /// Determines when the practice session has been completed.
  /// Compares the session score with the number of assessments generated.
  @State private var practiceComplete: Bool = false
  
  /// Initializes a new `PracticeView` and generates a `PracticeStore`
  /// instance for the practice session state management.
  init() {
    practiceStore = PracticeStore()
  }
  
  
}

extension PracticeView: View {
  
  var body: some View {
    Group {
      if practiceComplete {
        CongratulationsView()
      } else {
        ChallengeView(
          onComplete: onComplete,
          practice: practiceStore
        ).onAppear(perform: {
          self.practiceStore.build()
        })
      }
    }
  }
  
  func onComplete() {
    self.practiceComplete = true
  }
}

#if DEBUG
struct PracticeView_Previews: PreviewProvider {    
  static var previews: some View {
    return PracticeView()
  }
}
#endif
