//
//  SettingsState.swift
//  Kuchi
//
//  Created by CypherPoet on 10/29/19.
// ✌️
//

import Foundation
import Combine
import CypherPoetCore_PropertyWrappers


struct SettingsState {

    @UserDefault(UserDefaultsKey.shouldPersistProfile, defaultValue: true)
    var shouldPersistProfile: Bool

}

