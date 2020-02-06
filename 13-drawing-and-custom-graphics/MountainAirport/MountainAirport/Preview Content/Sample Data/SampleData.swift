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


enum SampleAwardsState {
    static let `default` = AwardsState(
        earnedAwards: [
            .firstVisit,
            .rideShareToAirport,
            .airportLoungeVisit,
        ]
    )
}


enum SampleFlightInformationState {
    static let `default` = FlightInformationState(flightInfo: SampleFlights.default)
}




enum SampleAppState {
    static let `default` = AppState(
        awardsState: SampleAwardsState.default,
        flightInformationState: SampleFlightInformationState.default
    )
}


enum SampleStore {
    static let `default` = AppStore(initialState: SampleAppState.default, appReducer: appReducer)
}



#endif
