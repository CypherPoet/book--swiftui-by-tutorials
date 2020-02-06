//
//  AwardsContainerView.swift
//  MountainAirport
//
//  Created by CypherPoet on 2/5/20.
// ✌️
//

import SwiftUI


struct AwardsContainerView {
    @EnvironmentObject private var store: AppStore
}


// MARK: - View
extension AwardsContainerView: View {

    var body: some View {
        AwardsListView(
            viewModel: .init(awardsState: awardsState)
        )
    }
}


// MARK: - Computeds
extension AwardsContainerView {
    var awardsState: AwardsState { store.state.awardsState }
    var earnedAwards: [Award] { awardsState.earnedAwards }
}


// MARK: - View Variables
extension AwardsContainerView {
}


// MARK: - Private Helpers
private extension AwardsContainerView {
}



// MARK: - Preview
struct AwardsContainerView_Previews: PreviewProvider {

    static var previews: some View {
        NavigationView {
            AwardsContainerView()
                .accentColor(.pink)
                .environmentObject(SampleStore.default)
                .navigationBarTitle("Awards")
        }
    }
}
