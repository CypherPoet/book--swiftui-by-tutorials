//
//  SettingsState.swift
//  Kuchi
//
//  Created by CypherPoet on 10/29/19.
// ✌️
//

import Combine
import CypherPoetCore_PropertyWrappers
import CypherPoetSwiftUIKit_DataFlowUtils


struct SettingsState {

    @UserDefault(UserDefaultsKey.shouldPersistProfile, defaultValue: true)
    var shouldPersistProfile: Bool

}

