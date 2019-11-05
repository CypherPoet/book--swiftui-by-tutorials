//
//  FlightBoardViewModel.swift
//  MountainAirport
//
//  Created by CypherPoet on 11/2/19.
// ✌️
//

import SwiftUI
import Combine


final class FlightBoardViewModel: ObservableObject {
    private var subscriptions = Set<AnyCancellable>()
    
    var flightData: [FlightInformation]
    var direction: FlightDirection
    
    @Published var isShowingCancelledFlights: Bool
    @Published var displayedFlights: [FlightInformation] = []
    
    
    init(
        flightData: [FlightInformation] = [],
        direction: FlightDirection,
        isShowingCancelledFlights: Bool = true
    ) {
        self.flightData = flightData
        self.direction = direction
        self.isShowingCancelledFlights = isShowingCancelledFlights
        
        setupSubscribers()
    }
}


// MARK: - Publishers
extension FlightBoardViewModel {
    
    private var allFlightsPublisher: AnyPublisher<[FlightInformation], Never> {
        CurrentValueSubject<[FlightInformation], Never>(flightData)
            .eraseToAnyPublisher()
    }

    
    private var nonCancelledFlightsPublisher: AnyPublisher<[FlightInformation], Never> {
        allFlightsPublisher
            .map { flights in
                flights.filter { $0.status != .cancelled }
            }
            .eraseToAnyPublisher()
    }

    
    private var displayedFlightsPublisher: AnyPublisher<[FlightInformation], Never> {
        Publishers.CombineLatest(allFlightsPublisher, $isShowingCancelledFlights)
            .flatMap { (_, showingCancelled) in
                showingCancelled ?
                    self.allFlightsPublisher
                    : self.nonCancelledFlightsPublisher
            }
//            .print("displayedFlightsPublisher: after flatmap")
            .eraseToAnyPublisher()
    }
}


// MARK: - Private Helpers
private extension FlightBoardViewModel {
    
    func setupSubscribers() {
        displayedFlightsPublisher
            .receive(on: DispatchQueue.main)
            .assign(to: \.displayedFlights, on: self)
            .store(in: &subscriptions)
    }
}
