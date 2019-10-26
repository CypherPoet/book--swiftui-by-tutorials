    //
//  WelcomeView.swift
//  Kuchi
//
//  Created by CypherPoet on 10/14/19.
// ✌️
//

import SwiftUI
import CypherPoetSwiftUIKit_ViewModifiers

struct WelcomeView: View {
    @EnvironmentObject var user: User
    
    @State var isShowingHomeView = false
}
 
    
extension WelcomeView {
    var body: some View {
        Group {
            if isShowingHomeView {
                HomeView()
            } else {
                welcomeScreen
            }
        }
    }
}

    
extension WelcomeView {

    private var welcomeScreen: some View {
        VStack(spacing: 50) {
            Text("Greetings, \(user.profile.name)!")
                .font(.system(size: 32))
                .fontWeight(.bold)
            
            WelcomeMessageView()
            
            Button(action: {
                self.isShowingHomeView = true
            }) {
                Image(systemName: "play")
                Text("Get Started")
            }
        }
        .background(WelcomeBackgroundImage())
        .foregroundColor(.pink)
    }
}
    

struct WelcomeView_Previews: PreviewProvider {
    
    static var previews: some View {
        Group {
            WelcomeView()
                .environmentObject(sampleUser)
            
            WelcomeView()
                .environmentObject(sampleUser)
                .environment(\.sizeCategory, .accessibilityExtraExtraExtraLarge)
        }
    }
    
}

    
