//
//  SampleData.swift
//  MountainAirport
//
//  Created by CypherPoet on 11/1/19.
// ✌️
//

#if DEBUG

import Foundation



enum SampleAppState {
    static let `default` = AppState()
}


enum SampleStore {
    static let `default` = AppStore(initialState: SampleAppState.default, appReducer: appReducer)
}



#endif
