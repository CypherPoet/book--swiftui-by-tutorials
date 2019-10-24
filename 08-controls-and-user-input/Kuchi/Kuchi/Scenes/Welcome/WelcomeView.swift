    //
//  WelcomeView.swift
//  Kuchi
//
//  Created by CypherPoet on 10/14/19.
// ✌️
//

import SwiftUI


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
        ZStack {
            Color
                .clear
                .background(
                    Image("swift_world")
                        .resizable()
                        .aspectRatio(1 / 1, contentMode: .fill)
                        .edgesIgnoringSafeArea(.all)
                        .saturation(0.5)
                        .blur(radius: 5)
                        .opacity(0.08)
                )
            
            VStack(spacing: 50) {
                
                Text("Greetings, \(user.profile.name)!")
                    .font(.system(size: 32))
                    .fontWeight(.bold)
                
                VStack(spacing: 4) {
                    Text("Welcome to")
                        .font(.system(size: 56))
                        .fontWeight(.bold)
                        .multilineTextAlignment(.leading)
                    
                    HStack {
                        Image(systemName: "table")
                            .resizable()
                            .frame(width: 60, height: 60)
                            .cornerRadius(60 / 2)
                            .background(Color(white: 0.9))
                            .clipShape(Circle())
                        
                        Text("Kuchi")
                            .font(.system(size: 80))
                            .fontWeight(.bold)
                            .multilineTextAlignment(.trailing)
                    }
                }
                .lineLimit(2)
                .fixedSize(horizontal: false, vertical: true)
                
                
                Button(action: {
                    self.isShowingHomeView = true
                }) {
                    Image(systemName: "play")
                    Text("Get Started")
                }
            }
            .foregroundColor(.pink)
        }
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
