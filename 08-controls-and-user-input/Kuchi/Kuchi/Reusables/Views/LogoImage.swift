//
//  LogoImage.swift
//  Kuchi
//
//  Created by CypherPoet on 10/24/19.
// ✌️
//

import SwiftUI


struct LogoImage: View {
}


// MARK: - Body
extension LogoImage {

    var body: some View {
        Image(systemName: "table")
            .resizable()
            .frame(width: 60, height: 60)
            .cornerRadius(60 / 2)
            .background(Color(white: 0.9))
            .clipShape(Circle())
    }
}


// MARK: - Preview
struct LogoImage_Previews: PreviewProvider {

    static var previews: some View {
        LogoImage()
    }
}
