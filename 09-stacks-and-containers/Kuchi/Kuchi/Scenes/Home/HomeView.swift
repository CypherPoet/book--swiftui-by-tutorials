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
    /// Will ensure the view redraws if the language is changed within system settings.
    @Environment(\.locale) var locale: Locale
    
    @State private var selectedTab = 0
}


// MARK: - Body
extension HomeView {

    var body: some View {
        TabView(selection: $selectedTab) {
            PracticeContainerView()
                .tabItem {
                    Image(systemName: "rectangle.dock")
                    Text("Challenge")
                }
                .tag(0)
            
            ProgressView()
                .tabItem {
                    Image(systemName: "chart.bar")
                    Text("Progress")
                }
                .tag(1)
            
            ProfileView()
                .tabItem {
                    Image(systemName: "person")
                    Text("Profile")
                }
                .tag(2)
        }
    }
}


// MARK: - Preview
struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
