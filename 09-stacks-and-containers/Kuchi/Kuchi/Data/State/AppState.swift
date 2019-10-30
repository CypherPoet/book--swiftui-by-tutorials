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



// MARK: - Reducer
let appReducer: Reducer<AppState, AppAction> = Reducer(reduce: { appState, action in
    switch action {
    case let .userAction(action):
        userReducer.reduce(&appState.userState, action)
    case let .userProfileAction(action):
        userProfileReducer.reduce(&appState.userProfileState, action)
    }
})
