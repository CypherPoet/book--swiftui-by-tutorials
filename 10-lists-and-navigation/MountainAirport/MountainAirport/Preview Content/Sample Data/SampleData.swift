//
//  SampleData.swift
//  MountainAirport
//
//  Created by CypherPoet on 11/1/19.
// ✌️
//

#if DEBUG

import Foundation

enum SampleFlights {
    static let `default` = FlightInformation.generateFlights()
}


enum SampleFlightInformationState {
    static let `default` = FlightInformationState(flightInfo: SampleFlights.default)
}


enum SampleAppState {
    static let `default` = AppState(flightInformationState: SampleFlightInformationState.default)
}


enum SampleStore {
    static let `default` = AppStore(initialState: SampleAppState.default, appReducer: appReducer)
}



#endif
