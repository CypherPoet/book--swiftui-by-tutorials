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
    final class ViewModel: ObservableObject {
        private var subscriptions = Set<AnyCancellable>()

        private let awardsState: AwardsState
        
        
        // MARK: - Published Outputs
        @Published var someValue: String = ""


        // MARK: - Init
        init(
            awardsState: AwardsState
        ) {
            self.awardsState = awardsState
            setupSubscribers()
        }
    }
}


// MARK: - Publishers
extension AwardsListView.ViewModel {

    private var someValuePublisher: AnyPublisher<String, Never> {
        Just("")
            .eraseToAnyPublisher()
    }
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

    func setupSubscribers() {
        someValuePublisher
            .receive(on: DispatchQueue.main)
            .assign(to: \.someValue, on: self)
            .store(in: &subscriptions)
    }
}
