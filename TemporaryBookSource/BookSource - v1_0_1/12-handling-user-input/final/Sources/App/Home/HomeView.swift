import SwiftUI

import Assessing

struct HomeView {
  /// Will ensure the view redraws if the language is changed within system settings.
  @Environment(\.locale) var locale: Locale
  
  @State var selectedTab = 0
  
}

extension HomeView: View {
  
  var body: some View {
    TabView {
      LearnView()
        .tabItem({
          VStack {
            Image(systemName: "bookmark")
            Text("Learn")
          }
        })
        .tag(0)
      PracticeView()
        .tabItem({
          VStack {
            Image(systemName: "rectangle.dock")
            Text("Challenge")
          }
        })
        .tag(1)
      ProgressView()
        .tabItem({
          VStack {
            Image(systemName: "chart.bar")
            Text("Progress")
          }
        })
        .tag(2)
      ProfileView()
        .tabItem({
          VStack {
            Image(systemName: "person")
            Text("Profile")
          }
        })
        .tag(3)
    }
    .accentColor(.orange)
  }
}

#if DEBUG
struct HomeView_Previews: PreviewProvider {
  static var previews: some View {
    HomeView()
  }
}
#endif
