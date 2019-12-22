//
//  EntryView.swift
//  Kuchi
//
//  Created by CypherPoet on 10/16/19.
// ✌️
//

import SwiftUI


struct EntryView: View {
    @EnvironmentObject private var store: AppStore
}


extension EntryView {
    var isRegistered: Bool { store.state.userState.isRegistered }
}


extension EntryView {
    var body: some View {
        Group {
            if isRegistered {
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
            .environmentObject(SampleStore.empty)
    }
}
