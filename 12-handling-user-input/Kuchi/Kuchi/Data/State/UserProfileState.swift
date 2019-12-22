//
//  UserProfileState.swift
//  Kuchi
//
//  Created by CypherPoet on 10/30/19.
// ✌️
//

import Foundation
import CypherPoetCore_PropertyWrappers
import CypherPoetSwiftUIKit_DataFlowUtils


struct UserProfileState {
    var profile = UserProfile()


    @UserDefault("saved-user-profile", defaultValue: Data())
    var savedProfileData: Data
}


// MARK: - Public Methods
extension UserProfileState {
  
    // TODO: These would be better off in some other service, and we should
    // use a side effect that maps to an action for setting the data returned
    // as a result.
    func encode(_ userProfile: UserProfile) -> Data {
        let encoder = PropertyListEncoder()

        return (try? encoder.encode(userProfile)) ?? Data()
    }
    

    func loadSavedProfile() -> UserProfile {
        let decoder = PropertyListDecoder()

        return (try? decoder.decode(UserProfile.self, from: savedProfileData)) ?? UserProfile()
    }
}



enum UserProfileAction {
    case clear
    case load
    case persist(_ profile: UserProfile)
}


// MARK: - Reducer
let userProfileReducer: Reducer<UserProfileState, UserProfileAction> = Reducer(
    reduce: { userProfileState, action in
        switch action {
        case .clear:
            userProfileState.savedProfileData = Data()
        case .load:
            userProfileState.profile = userProfileState.loadSavedProfile()
        case let .persist(profile):
            userProfileState.savedProfileData = userProfileState.encode(profile)
        }
    }
)

