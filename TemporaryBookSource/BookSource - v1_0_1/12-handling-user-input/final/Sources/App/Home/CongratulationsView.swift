import SwiftUI

struct CongratulationsView: View {
  var body: some View {
    VStack {
      Text("Congratulations")
        .font(.largeTitle)
      Spacer()
    }
  }
}

#if DEBUG
struct CongratulationsView_Previews: PreviewProvider {
  static var previews: some View {
    CongratulationsView()
  }
}
#endif
