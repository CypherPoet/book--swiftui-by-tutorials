//
//  UserSettings.swift
//  Kuchi
//
//  Created by CypherPoet on 10/26/19.
// ✌️
//

import Foundation


struct UserSettings {
    var shouldPersistProfile: Bool = true
}


extension UserSettings: Codable {}
