//
//  EntryView.swift
//  Kuchi
//
//  Created by CypherPoet on 10/16/19.
// ✌️
//

import SwiftUI


struct EntryView: View {
    @EnvironmentObject var userStore: UserStore
}


extension EntryView {
    var body: some View {
        Group {
            if userStore.isRegistered {
                WelcomeView(username: userStore.profile.name!)
            } else {
                RegistrationView()
            }
        }
    }
}


struct EntryView_Previews: PreviewProvider {
    static var previews: some View {
        EntryView()
            .environmentObject(sampleUserStoreWithProfile)
    }
}
