//
//  Award+BadgeView.swift
//  MountainAirport
//
//  Created by CypherPoet on 2/5/20.
// ✌️
//

import Foundation
import SwiftUI


extension Award {
    var badgeView: AnyView {
        switch self {
        case .firstVisit:
            return AnyView(FirstVisitAwardView())
        case .rideShareToAirport:
            return AnyView(RideShareToAirportAwardView())
        case .airportLoungeVisit:
           return AnyView(AirportLoungeAwardView())
        }
    }
}
