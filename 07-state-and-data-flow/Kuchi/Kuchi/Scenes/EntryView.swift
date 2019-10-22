//
//  EntryView.swift
//  Kuchi
//
//  Created by CypherPoet on 10/16/19.
// ✌️
//

import SwiftUI


struct EntryView: View {
    @EnvironmentObject var user: User
}


extension EntryView {
    var body: some View {
        Group {
            if user.isRegistered {
                WelcomeView()
            } else {
                RegistrationView()
            }
        }
    }
}


struct EntryView_Previews: PreviewProvider {
    static var previews: some View {
        EntryView()
            .environmentObject(sampleUser)
    }
}
