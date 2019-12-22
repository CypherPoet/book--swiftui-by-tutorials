//
//  Samples.swift
//  Kuchi
//
//  Created by CypherPoet on 10/30/19.
// ✌️
//

#if DEBUG

import Foundation
import CypherPoetSwiftUIKit_DataFlowUtils


enum SampleAppState {
    static let empty = AppState()
    
    static let withUserProfile = AppState(
        userProfileState: UserProfileState(
            profile: UserProfile(name: "CypherPoet")
        )
    )
}
    

enum SampleUserState {
    static let `default` = UserState()
}


enum SampleSettingsState {
    static let `default` = SettingsState()
}


enum SampleUser {
    static let `default` = User()
}


enum SampleStore {
    
    static let empty: Store<AppState, AppAction> = {
        Store(initialState: SampleAppState.empty, appReducer: appReducer)
    }()
    
    
    static let withUserProfile: Store<AppState, AppAction> = {
        Store(initialState: SampleAppState.withUserProfile, appReducer: appReducer)
    }()
}



#endif

