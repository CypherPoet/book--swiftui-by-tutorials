//
//  FlightStatus.swift
//  MountainAirport
//
//  Created by CypherPoet on 11/1/19.
// ✌️
//

import Foundation


public enum FlightStatus: String, CaseIterable {
    case onTime
    case delayed
    case cancelled
    case landed
    case departed
}


extension FlightStatus {
    
    var displayName: String {
        switch self {
        case .onTime:
            return "On Time"
        case .delayed:
            return "Delayed"
        case .cancelled:
            return "Cancelled"
        case .landed:
            return "Landed"
        case .departed:
            return "Departed"
        }
    }
}
