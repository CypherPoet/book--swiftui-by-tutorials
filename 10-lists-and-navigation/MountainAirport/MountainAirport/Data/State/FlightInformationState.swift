//
//  FlightInformationState.swift
//  MountainAirport
//
//  Created by CypherPoet on 11/1/19.
// ✌️
//

import Foundation
import CypherPoetSwiftUIKit_DataFlowUtils



struct FlightInformationState {
    var flightInfo: [FlightInformation] = []
}



enum FlightInformationAction {
    case load
}


// MARK: - Reducer
let flightInformationReducer = Reducer<FlightInformationState, FlightInformationAction> {
    state, action in
    switch action {
    case .load:
        state.flightInfo = FlightInformation.generateFlights()
    }
}
