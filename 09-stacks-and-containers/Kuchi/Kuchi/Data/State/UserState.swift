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
import CypherPoetCore_PropertyWrappers



struct UserState {
    @EnvironmentObject private var store: Store<AppState, AppAction>

    var user = User()
    
//
//    init() {
//        if let profile = store.state.userProfileState.profile {
//            user.profile = profile
//        }
//    }
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





let userReducer: Reducer<UserState, UserAction> = Reducer(reduce: { userState, action in
    switch action {
    case let .save(user):
        userState.user = user
    case .register:
        userState.user.isRegistered = true
    }
})


