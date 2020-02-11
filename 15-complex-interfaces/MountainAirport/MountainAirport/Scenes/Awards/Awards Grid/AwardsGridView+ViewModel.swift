//
//  AwardsGridView+ViewModel.swift
//  MountainAirport
//
//  Created by CypherPoet on 2/5/20.
// ✌️
//


import SwiftUI
import Combine


extension AwardsGridView {
    struct ViewModel {
        let awardsState: AwardsState
    }
}


// MARK: - Publishers
extension AwardsGridView.ViewModel {
}


// MARK: - Computeds
extension AwardsGridView.ViewModel {
    var awards: [Award] { awardsState.earnedAwards }
}


// MARK: - Public Methods
extension AwardsGridView.ViewModel {
}



// MARK: - Private Helpers
private extension AwardsGridView.ViewModel {
}
