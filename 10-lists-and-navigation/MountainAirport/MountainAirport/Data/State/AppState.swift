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


enum AppAction {
    case flightInfo(_ action: FlightInformationAction)
}


// MARK: - Reducer
let appReducer = Reducer<AppState, AppAction> { appState, action in
    switch action {
    case let .flightInfo(action):
        flightInformationReducer.reduce(&appState.flightInformationState, action)
    }
}

typealias AppStore = Store<AppState, AppAction>
