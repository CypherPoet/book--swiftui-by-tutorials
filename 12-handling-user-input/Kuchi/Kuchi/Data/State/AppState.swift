//
//  AppState.swift
//  Kuchi
//
//  Created by CypherPoet on 10/29/19.
// ✌️
//

import Foundation
import CypherPoetSwiftUIKit_DataFlowUtils


struct AppState {
    var learningState = LearningState()
    var userState = UserState()
    var userProfileState = UserProfileState()
    var settingsState = SettingsState()
}



enum AppAction {
    case learning(_ action: LearningAction)
    case user(_ action: UserAction)
    case userProfile(_ action: UserProfileAction)
}



// MARK: - Reducer
let appReducer: Reducer<AppState, AppAction> = Reducer(reduce: { appState, action in
    switch action {
    case let .user(action):
        userReducer.reduce(&appState.userState, action)
    case let .userProfile(action):
        userProfileReducer.reduce(&appState.userProfileState, action)
    case let .learning(action):
        learningReducer.reduce(&appState.learningState, action)
    }
})


typealias AppStore = Store<AppState, AppAction>
