//
//  EntryView.swift
//  Kuchi
//
//  Created by CypherPoet on 10/16/19.
// ✌️
//

import SwiftUI


struct EntryView: View {
    private let userName: String
    private let isRegistered: Bool
    
    
    init(
        userName: String,
        isRegistered: Bool
    ) {
        self.userName = userName
        self.isRegistered = isRegistered
    }
}


extension EntryView {
    var body: some View {
        Group {
            if isRegistered {
                WelcomeView(userName: userName)
            } else {
                RegistrationView()
            }
        }
    }
}


struct EntryView_Previews: PreviewProvider {
    static var previews: some View {
        EntryView(userName: "CypherPoet", isRegistered: true)
    }
}
