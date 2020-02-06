//
//  Award.swift
//  MountainAirport
//
//  Created by CypherPoet on 2/5/20.
// ✌️
//

import Foundation



enum Award: String {
    case firstVisit
    case rideShareToAirport
}


extension Award: CaseIterable {}

extension Award: Identifiable {
    var id: String { self.rawValue }
}
