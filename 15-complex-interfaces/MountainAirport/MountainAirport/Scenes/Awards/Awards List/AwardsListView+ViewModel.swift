//
//  AwardsListView+ViewModel.swift
//  MountainAirport
//
//  Created by CypherPoet on 2/5/20.
// ✌️
//


import SwiftUI
import Combine


extension AwardsListView {
    struct ViewModel {
        let awardsState: AwardsState
    }
}


// MARK: - Publishers
extension AwardsListView.ViewModel {
}


// MARK: - Computeds
extension AwardsListView.ViewModel {
    var awards: [Award] { awardsState.earnedAwards }
}


// MARK: - Public Methods
extension AwardsListView.ViewModel {
}



// MARK: - Private Helpers
private extension AwardsListView.ViewModel {
}
