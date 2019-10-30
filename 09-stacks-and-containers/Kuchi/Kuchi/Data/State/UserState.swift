//
//  UserState.swift
//  Kuchi
//
//  Created by CypherPoet on 10/19/19.
// ✌️
//

import Foundation
import Combine
import SwiftUI



struct UserState {
    @EnvironmentObject private var store: Store<AppState, AppAction>

    var user = User()
}



// MARK: - Computeds
extension UserState {
    var isRegistered: Bool { user.isRegistered }
    var settingsState: SettingsState { store.state.settingsState }
}



// MARK: - Public Methods
extension UserState {
}


// MARK: - Private Helpers
private extension UserState {

}



enum UserAction {
    case save(_ user: User)
    case register
}



// MARK: - Reducer
let userReducer: Reducer<UserState, UserAction> = Reducer(reduce: { userState, action in
    switch action {
    case let .save(user):
        userState.user = user
    case .register:
        userState.user.isRegistered = true
    }
})


