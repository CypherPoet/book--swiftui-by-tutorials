//
//  FlightBoardItemDetails+ViewModel.swift
//  MountainAirport
//
//  Created by CypherPoet on 2/5/20.
// ✌️
//


import SwiftUI
import Combine


extension FlightBoardItemDetails {
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
extension FlightBoardItemDetails.ViewModel {

    private var someValuePublisher: AnyPublisher<String, Never> {
        Just("")
            .eraseToAnyPublisher()
    }
}


// MARK: - Computeds
extension FlightBoardItemDetails.ViewModel {
    var flightHeaderHeadlineText: String {
        "\(flightInfo.airline) Flight \(flightInfo.number)"
    }
    
    var flightDirectionHeaderText: String {
        "\(flightInfo.direction == .arrival ? "From: " : "To: ")\(flightInfo.connectingAirport)"
    }
    
    var flightStatusText: String { flightInfo.flightBoardStatus }
    
    var flightStatusTextColor: Color { Color(flightInfo.timelineColor) }
}


// MARK: - Public Methods
extension FlightBoardItemDetails.ViewModel {
}



// MARK: - Private Helpers
private extension FlightBoardItemDetails.ViewModel {

    func setupSubscribers() {
        someValuePublisher
            .receive(on: DispatchQueue.main)
            .assign(to: \.someValue, on: self)
            .store(in: &subscriptions)
    }
}
