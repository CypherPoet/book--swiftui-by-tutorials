//
//  WelcomeBackgroundImage.swift
//  Kuchi
//
//  Created by CypherPoet on 10/24/19.
// ✌️
//

import SwiftUI


struct WelcomeBackgroundImage: View {
}


// MARK: - Body
extension WelcomeBackgroundImage {

    var body: some View {
        Image("swift_world")
            .resizable()
            .aspectRatio(1 / 1, contentMode: .fill)
            .edgesIgnoringSafeArea(.all)
            .saturation(0.5)
            .blur(radius: 5)
            .opacity(0.08)
    }
}


// MARK: - Preview
struct WelcomeBackgroundImage_Previews: PreviewProvider {

    static var previews: some View {
        WelcomeBackgroundImage()
    }
}
