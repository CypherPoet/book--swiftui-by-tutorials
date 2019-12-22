//
//  UserBanner.swift
//  Kuchi
//
//  Created by CypherPoet on 10/29/19.
// ✌️
//

import SwiftUI
import CypherPoetSwiftUIKit_DataFlowUtils


struct UserBanner: View {
    @EnvironmentObject private var store: Store<AppState, AppAction>
    
    let avatarRadius: CGFloat = 64.0
}



// MARK: - Computeds
extension UserBanner {
    var username: String {
        store.state.userProfileState.profile.name ?? ""
    }
}


// MARK: - Body
extension UserBanner {

    var body: some View {
        ZStack {
            bannerBackground
            userAvatar
            userName
        }
        .frame(height: 180)
    }
}



extension UserBanner {
    
    private var bannerBackground: some View {
        VStack(spacing: 0) {
            Rectangle()
                .frame(height: 90)
                .foregroundColor(Color.red.opacity(0.3))
                .saturation(1.1)
            Rectangle()
                .frame(height: 90)
                .foregroundColor(Color.red.opacity(0.6))
                .saturation(0.9)
        }
    }
    
    
    
    private var userAvatar: some View {
        Image(systemName: "person.fill")
            .resizable()
            .padding()
            .frame(width: avatarRadius * 2, height: avatarRadius * 2)
            .background(Color.white.opacity(0.5))
            .cornerRadius(avatarRadius, antialiased: true)
            .shadow(radius: 4)
    }
    
    
    
    private var userName: some View {
        VStack {
            Spacer()
            
            Text("\(username)")
                .font(.title)
                .foregroundColor(.white)
                .fontWeight(.bold)
                .shadow(radius: 7)
        }
        .padding()
    }
}




// MARK: - Preview
struct UserBanner_Previews: PreviewProvider {

    static var previews: some View {
        UserBanner()
            .environmentObject(SampleStore.withUserProfile)
    }
}
