//
//  Samples.swift
//  Kuchi
//
//  Created by CypherPoet on 10/30/19.
// ✌️
//

#if DEBUG

import Foundation



enum SampleAppState {
    static let unRegisteredUser = AppState()
}
    

enum SampleUserState {
    static let `default` = UserState()
//    static let unregistered = UserState(user: SampleUser.unregistered)
//    static let registered = UserState(user: SampleUser.registered)
}


enum SampleSettingsState {
    static let `default` = SettingsState()
}


enum SampleUser {
    static let `default` = User()
//    static let registered = User(name: "CypherPoet")
}


enum SampleStore {
    
    static let `default`: Store<AppState, AppAction> = {
        Store(initialState: SampleAppState.unRegisteredUser, appReducer: appReducer)
    }()
    
}

#endif

