//
//  UserBanner.swift
//  Kuchi
//
//  Created by CypherPoet on 10/29/19.
// ✌️
//

import SwiftUI


struct UserBanner: View {
    @EnvironmentObject private var store: Store<AppState, AppAction>
}


// MARK: - Body
extension UserBanner {

    var body: some View {
        ZStack {
            bannerBackground
            userAvatar
            userName
        }
    }
}



extension UserBanner {
    
    private var bannerBackground: some View {
        EmptyView()
    }
    
    
    
    private var userAvatar: some View {
        EmptyView()
    }
    
    
    
    private var userName: some View {
        EmptyView()
    }
}




// MARK: - Preview
struct UserBanner_Previews: PreviewProvider {

    static var previews: some View {
        UserBanner()
    }
}
