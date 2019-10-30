//
//  UserProfileState.swift
//  Kuchi
//
//  Created by CypherPoet on 10/30/19.
// ✌️
//

import Foundation
import CypherPoetCore_PropertyWrappers



struct UserProfileState {
    var profile = UserProfile()


    @UserDefault("saved-user-profile", defaultValue: Data())
    var savedProfileData: Data
}


// MARK: - Public Methods
extension UserProfileState {
  
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

