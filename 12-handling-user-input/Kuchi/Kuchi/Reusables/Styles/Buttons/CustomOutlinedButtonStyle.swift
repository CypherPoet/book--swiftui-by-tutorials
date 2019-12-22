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
    public var minWidth: CGFloat?
    public var minHeight: CGFloat?
    public var foregroundColor: Color
    public var borderColor: Color
    public var borderWidth: CGFloat
    
    
    public init(
        width: CGFloat? = 44,
        height: CGFloat? = 44,
        foregroundColor: Color = .accentColor,
        borderColor: Color = .accentColor,
        borderWidth: CGFloat = 3.0
    ) {
        self.minWidth = width
        self.minHeight = height
        self.foregroundColor = foregroundColor
        self.borderColor = borderColor
        self.borderWidth = borderWidth
    }
}


// MARK: - makeBody
extension CustomOutlinedButtonStyle {
    
    public func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .frame(minWidth: minWidth, minHeight: minHeight)
            .padding(.horizontal, 14)
            .padding(.vertical, 6)
            .foregroundColor(foregroundColor)
            .background(
                RoundedRectangle(cornerRadius: 8, style: .continuous)
                    .stroke(borderColor, lineWidth: borderWidth)
            )
    }
}



struct CustomOutlinedButtonStyle_Previews : PreviewProvider {
    
    static var previews: some View {
        VStack(spacing: 20) {
            Button(action: {}) {
                Text("Hello!")
                    .frame(width: 200)
            }.buttonStyle(
                CustomOutlinedButtonStyle()
            )
            
            
            Button(action: {}) {
                Text("Hello, Custom Button with Long Text!")
            }.buttonStyle(
                CustomOutlinedButtonStyle()
            )
            
            
            Button(action: {}) {
                Text("Hello!")
            }.buttonStyle(
                CustomOutlinedButtonStyle()
            )
        }
    }
}

