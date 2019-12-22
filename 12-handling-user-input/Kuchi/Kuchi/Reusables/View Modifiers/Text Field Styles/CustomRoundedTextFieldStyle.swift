//
//  CustomRoundedTextFieldStyle.swift
//  Kuchi
//
//  Created by CypherPoet on 10/25/19.
// ✌️
//

import SwiftUI


struct CustomRoundedTextFieldStyle: ViewModifier {
    
    func body(content: Content) -> some View {
        content
            .padding(EdgeInsets(top: 8, leading: 16, bottom: 8, trailing: 16))
            .background(Color(UIColor.systemBackground))
            .overlay(
                RoundedRectangle(cornerRadius: 12)
                    .stroke(lineWidth: 2)
                    .foregroundColor(.accentColor)
            )
            .shadow(color: Color.gray.opacity(0.4), radius: 3, x: 1, y: 2)
    }
}


