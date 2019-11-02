//
//  FlightInformationState.swift
//  MountainAirport
//
//  Created by CypherPoet on 11/1/19.
// ✌️
//

import Foundation
import CypherPoetSwiftUIKit_DataFlowUtils
import Combine


struct FlightInformationState {
    var flightInfo: [FlightInformation] = []
}


enum FlightInformationSideEffect: SideEffect {
    case load
    
    func mapToAction() -> AnyPublisher<AppAction, Never> {
        switch self {
        case .load:
            return Just("")
                .subscribe(on: DispatchQueue.global(qos: .userInitiated))
                .map { _ in  FlightInformation.generateFlights() }
                .map { AppAction.flightInfo(.setInfo($0)) }
                .eraseToAnyPublisher()
        }
    }
}



enum FlightInformationAction {
    case setInfo(_ flightInfo: [FlightInformation])
}


// MARK: - Reducer
let flightInformationReducer = Reducer<FlightInformationState, FlightInformationAction> {
    state, action in
    switch action {
    case let .setInfo(flightInfo):
        state.flightInfo = flightInfo
    }
}
