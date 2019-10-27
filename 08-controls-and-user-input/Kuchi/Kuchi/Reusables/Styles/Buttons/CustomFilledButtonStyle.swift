//
//  CustomFilledButtonStyle.swift
//  Kuchi
//
//  Created by CypherPoet on 10/27/19.
// ✌️
//

import Foundation
import SwiftUI


struct CustomFilledButtonStyle: ButtonStyle {
    var fillColor: Color = .accentColor
    var foregroundColor: Color = .white
    var foregroundColorWhenPressed: Color = .gray
    
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .frame(minWidth: 44, minHeight: 44)
            .padding(.horizontal, 14)
            .padding(.vertical, 6)
            .foregroundColor(
                configuration.isPressed ? foregroundColorWhenPressed : .white
            )
            .background(fillColor)
            .cornerRadius(8)
    }
}

