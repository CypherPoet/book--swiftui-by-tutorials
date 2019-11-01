//
//  AppState.swift
//  MountainAirport
//
//  Created by CypherPoet on 11/1/19.
// ✌️
//

import Foundation
import CypherPoetSwiftUIKit_DataFlowUtils




struct AppState {
    var flightInformationState = FlightInformationState()
}


enum AppAction {}


// MARK: - Reducer
let appReducer = Reducer<AppState, AppAction> { appState, action in
    
}
