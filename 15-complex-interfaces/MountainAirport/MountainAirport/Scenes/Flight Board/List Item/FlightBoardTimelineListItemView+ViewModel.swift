//
//  FlightBoardTimelineListItemView+ViewModel.swift
//  MountainAirport
//
//  Created by CypherPoet on 2/10/20.
// ✌️
//


import SwiftUI
import Combine


extension FlightBoardTimelineListItemView {
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
extension FlightBoardTimelineListItemView.ViewModel {

    private var someValuePublisher: AnyPublisher<String, Never> {
        Just("")
            .eraseToAnyPublisher()
    }
}


// MARK: - Computeds
extension FlightBoardTimelineListItemView.ViewModel {
    
    var flightDirectionHeaderText: String {
        "\(flightInfo.direction == .arrival ? "From: " : "To: ")\(flightInfo.connectingAirport)"
    }
    
    var timelineColor: Color { Color(flightInfo.timelineColor) }
}



// MARK: - Public Methods
extension FlightBoardTimelineListItemView.ViewModel {
}



// MARK: - Private Helpers
private extension FlightBoardTimelineListItemView.ViewModel {

    func setupSubscribers() {
        someValuePublisher
            .receive(on: DispatchQueue.main)
            .assign(to: \.someValue, on: self)
            .store(in: &subscriptions)
    }
}
