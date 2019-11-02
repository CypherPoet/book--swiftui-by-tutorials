//
//  SampleData.swift
//  MountainAirport
//
//  Created by CypherPoet on 11/1/19.
// ✌️
//

#if DEBUG

import Foundation


enum SampleFlightInformationState {
    static let `default` = FlightInformationState(flightInfo: FlightInformation.generateFlights())
}


enum SampleAppState {
    static let `default` = AppState(flightInformationState: SampleFlightInformationState.default)
}


enum SampleStore {
    static let `default` = AppStore(initialState: SampleAppState.default, appReducer: appReducer)
}



#endif
