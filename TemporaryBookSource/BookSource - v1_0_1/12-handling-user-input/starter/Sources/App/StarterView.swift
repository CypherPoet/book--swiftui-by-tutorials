import SwiftUI

struct StarterView {
  
  @EnvironmentObject var user: User
}

extension StarterView: View {
  
  var body: some View {
    Group {
      if self.user.isRegistered {
        WelcomeView()
      } else {
        RegisterView()
      }
    }
  }
  
}

#if DEBUG
struct StarterView_Previews: PreviewProvider {
  static var previews: some View {
    StarterView()
      .environmentObject(User())
  }
}
#endif
