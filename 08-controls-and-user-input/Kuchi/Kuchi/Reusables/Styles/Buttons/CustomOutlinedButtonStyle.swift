//
//  CustomOutlinedButtonStyle.swift
//  Kuchi
//
//  Created by CypherPoet on 10/27/19.
// ✌️
//

import Foundation
import SwiftUI


struct CustomOutlinedButtonStyle: ButtonStyle {
    let foregroundColor: Color = .accentColor
    let borderColor: Color = .accentColor
    
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .frame(minWidth: 44, minHeight: 44)
            .padding()
            .foregroundColor(foregroundColor)
            .background(
                RoundedRectangle(cornerRadius: 8, style: .continuous)
                    .stroke(borderColor)
            )
            .border(Color.accentColor, width: 2)
    }
}
