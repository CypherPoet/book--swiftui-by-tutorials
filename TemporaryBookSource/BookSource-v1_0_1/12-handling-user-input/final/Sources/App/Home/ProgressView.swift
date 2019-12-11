import SwiftUI

struct ProgressView: View {
  var body: some View {
    VStack {
      Text("Progress")
        .font(.largeTitle)
      Spacer()
    }
  }
}

#if DEBUG
struct ProgressView_Previews: PreviewProvider {
  static var previews: some View {
    ProgressView()
  }
}
#endif
