//
//  FlightDirection.swift
//  MountainAirport
//
//  Created by CypherPoet on 11/1/19.
// ✌️
//

import Foundation


public enum FlightDirection {
    case arrival
    case departure
}


extension FlightDirection {
    
    var boardName: String {
        switch self {
        case .arrival:
            return "Arrivals"
        case .departure:
            return "Departures"
        }
    }
}
