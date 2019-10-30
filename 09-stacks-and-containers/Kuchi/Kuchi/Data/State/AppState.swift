//
//  AppState.swift
//  Kuchi
//
//  Created by CypherPoet on 10/29/19.
// ✌️
//

import Foundation


struct AppState {
    var userState = UserState()
    var userProfileState = UserProfileState()
    var settingsState = SettingsState()
}



enum AppAction {
    case userAction(_ action: UserAction)
    case userProfileAction(_ action: UserProfileAction)
}
