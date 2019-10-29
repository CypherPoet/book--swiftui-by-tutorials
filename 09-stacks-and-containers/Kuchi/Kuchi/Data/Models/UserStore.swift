//
//  UserStore.swift
//  Kuchi
//
//  Created by CypherPoet on 10/19/19.
// ✌️
//

import Foundation
import Combine
import SwiftUI
import CypherPoetCore_PropertyWrappers


final class UserStore: ObservableObject {
    @EnvironmentObject var settingsStore: SettingsStore

    @Published var profile = UserProfile()
    
    
    @UserDefault("saved-user-profile", defaultValue: Data())
    private var savedProfileData: Data

    
    init() {}
    
    
    init(name: String) {
        self.profile = UserProfile(name: name)
    }
}



// MARK: - Computeds
extension UserStore {
    var isRegistered: Bool { profile.name != nil }
}



// MARK: - Public Methods
extension UserStore {
    
    func saveNewUser() {
        if settingsStore.shouldPersistProfile {
            encodeUserProfile()
        } else {
            clearUserProfile()
        }
    }
    
    
    func loadSavedData() {
        let decoder = PropertyListDecoder()
        
        if let savedUserProfile = try? decoder.decode(UserProfile.self, from: savedProfileData) {
            self.profile = savedUserProfile
        }
    }
}


// MARK: - Private Helpers
private extension UserStore {
    
    func encodeUserProfile() {
        let encoder = PropertyListEncoder()
        
        savedProfileData = (try? encoder.encode(profile)) ?? Data()
    }

    
    func clearUserProfile() {
        savedProfileData = Data()
    }
}





#if DEBUG

let sampleEmptyUserStore = UserStore()
let sampleUserStoreWithProfile = UserStore(name: "CypherPoet")

#endif

