//
//  FlightGateDetailsView+ViewModel.swift
//  MountainAirport
//
//  Created by CypherPoet on 2/6/20.
// ✌️
//


import SwiftUI
import Combine


extension FlightGateDetailsView {
    final class ViewModel: ObservableObject {
        private var subscriptions = Set<AnyCancellable>()

        let flightInfo: FlightInformation

        
        // MARK: - Published Outputs
        @Published var someValue: String = ""


        // MARK: - Init
        init(
            flightInfo: FlightInformation
        ) {
            self.flightInfo = flightInfo
            
            setupSubscribers()
        }
    }
}


// MARK: - Publishers
extension FlightGateDetailsView.ViewModel {

    private var someValuePublisher: AnyPublisher<String, Never> {
        Just("")
            .eraseToAnyPublisher()
    }
}


// MARK: - Computeds
extension FlightGateDetailsView.ViewModel {
    
    var flightGateActionText: String {
        "\(flightInfo.direction == .arrival ? "Arriving at" : "Departing from") Gate: \(flightInfo.gate)"
    }
    
    var scheduledTimeText: String { "Scheduled: \(flightInfo.scheduledTimeString)" }
    var currentEstimatedTimeText: String { "Current: \(flightInfo.currentTimeString)" }
    
    var mapImageName: String {
        flightInfo.gate.starts(with: "A") ? "terminal-a-map" : "terminal-b-map"
    }
}


// MARK: - Public Methods
extension FlightGateDetailsView.ViewModel {
}



// MARK: - Private Helpers
private extension FlightGateDetailsView.ViewModel {

    func setupSubscribers() {
        someValuePublisher
            .receive(on: DispatchQueue.main)
            .assign(to: \.someValue, on: self)
            .store(in: &subscriptions)
    }
}
