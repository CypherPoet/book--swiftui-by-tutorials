//
//  UserStore.swift
//  Kuchi
//
//  Created by CypherPoet on 10/19/19.
// ✌️
//

import Foundation
import Combine
import CypherPoetCore_PropertyWrappers


final class UserStore: ObservableObject {
    @Published var profile = UserProfile()
    @Published var settings = UserSettings()
    
    // 🤔 Not sure if its ideal to have a manual `willChange` instead of using
    // @Published, but this is the book example if we need to use it:

//    let willChange = PassthroughSubject<User, Never>()
//
//    var profile = Profile() {
//        willSet {
//            // 📝 The idea is that a subscriber can receive the `User` instance
//            // whenever the `profile` changes (`@Published` would send the `profile`).
//            //
//            // Again... skeptical, but rolling with it for now
//            willChange.send(self)
//        }
//    }
    
    
    @UserDefault("saved-user-profile", defaultValue: Data())
    private var savedProfileData: Data
    
    
    @UserDefault("saved-user-settings", defaultValue: Data())
    private var savedSettingsData: Data

    
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
    
    func persistProfile() {
        if settings.shouldPersistProfile {
            encodeUserProfile()
        }
    }
    
    
    func loadSavedData() {
        let decoder = PropertyListDecoder()
        
        if let savedUserProfile = try? decoder.decode(UserProfile.self, from: savedProfileData) {
            self.profile = savedUserProfile
        }
        
        if let savedUserSettings = try? decoder.decode(UserSettings.self, from: savedSettingsData) {
            self.settings = savedUserSettings
        }
    }
}


// MARK: - Private Helpers
extension UserStore {
    
    func encodeUserProfile() {
        let encoder = PropertyListEncoder()
        
        savedProfileData = (try? encoder.encode(profile)) ?? Data()
//        do {
//            savedProfileData = try? encoder.encode(profile) ?? Data()
//        } catch {
//            print("Error encoding order data: \(error.localizedDescription)")
//        }
    }
}





#if DEBUG

let sampleEmptyUserStore = UserStore()
let sampleUserStoreWithProfile = UserStore(name: "CypherPoet")

#endif

