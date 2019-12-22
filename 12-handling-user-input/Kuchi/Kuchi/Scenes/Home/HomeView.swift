//
//  HomeView.swift
//  Kuchi
//
//  Created by CypherPoet on 10/19/19.
// ✌️
//

import SwiftUI
import Assessing


struct HomeView: View {
    /// Ensure that the view redraws if the language is changed within system settings.
    @Environment(\.locale) var locale: Locale
    @EnvironmentObject var store: AppStore

    @State private var selectedTab = 0
}


// MARK: - Body
extension HomeView {

    var body: some View {
        TabView(selection: $selectedTab) {
            
            LearningContainerView(
                flashCardDeck: learningState.flashCardDeck
            )
                .tabItem {
                    Image(systemName: "bookmark")
                    Text("Learn")
                }
                .tag(0)
            
            
            PracticeContainerView()
                .tabItem {
                    Image(systemName: "rectangle.dock")
                    Text("Challenge")
                }
                .tag(1)
            
            ProgressView()
                .tabItem {
                    Image(systemName: "chart.bar")
                    Text("Progress")
                }
                .tag(2)
            
            ProfileView()
                .tabItem {
                    Image(systemName: "person")
                    Text("Profile")
                }
                .tag(3)
        }
    }
}


// MARK: - Computeds
extension HomeView {
    var learningState: LearningState { store.state.learningState }
}


// MARK: - Preview
struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
            .environmentObject(SampleStore.withUserProfile)
    }
}
