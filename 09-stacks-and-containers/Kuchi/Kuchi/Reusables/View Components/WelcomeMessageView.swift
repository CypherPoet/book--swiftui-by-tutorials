//
//  WelcomeMessageView.swift
//  Kuchi
//
//  Created by CypherPoet on 10/24/19.
// ✌️
//

import SwiftUI


struct WelcomeMessageView: View {
}


// MARK: - Body
extension WelcomeMessageView {

    var body: some View {
        VStack(spacing: 4) {
            Text("Welcome to")
                .scaledSystemFont(size: 56, weight: .bold)
                .multilineTextAlignment(.leading)
            
            HStack {
                LogoImage()
                
                Text("Kuchi")
                    .scaledSystemFont(size: 65, weight: .bold)
                    .multilineTextAlignment(.trailing)
            }
        }
        .lineLimit(2)
        .fixedSize(horizontal: false, vertical: true)
    }
}


// MARK: - Preview
struct WelcomeMessageView_Previews: PreviewProvider {

    static var previews: some View {
        WelcomeMessageView()
    }
}
