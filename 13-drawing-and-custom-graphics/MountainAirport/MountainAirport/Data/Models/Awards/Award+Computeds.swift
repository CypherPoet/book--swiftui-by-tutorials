//
//  Award+Computeds.swift
//  MountainAirport
//
//  Created by CypherPoet on 2/5/20.
// ✌️
//

import Foundation


extension Award {
    
    var title: String {
        switch self {
        case .firstVisit:
            return "First Airport Visit"
        case .rideShareToAirport:
            return "Ride Share to Airport"
        case .airportLoungeVisit:
            return "Lounge Visit"
        }
    }
}
