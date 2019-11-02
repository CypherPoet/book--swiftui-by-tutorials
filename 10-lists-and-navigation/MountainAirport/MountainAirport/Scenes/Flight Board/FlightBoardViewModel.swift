//
//  FlightBoardViewModel.swift
//  MountainAirport
//
//  Created by CypherPoet on 11/2/19.
// ✌️
//

import SwiftUI



final class FlightBoardViewModel: ObservableObject {
    let direction: FlightDirection
    
    @Published var flightData: [FlightInformation]
    
    
    init(
        direction: FlightDirection,
        flightData: [FlightInformation] = []
    ) {
        self.direction = direction
        self.flightData = flightData
    }
}
