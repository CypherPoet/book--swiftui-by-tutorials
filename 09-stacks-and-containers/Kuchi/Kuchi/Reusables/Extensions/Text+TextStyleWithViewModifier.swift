//
//  Text+TextStyleWithViewModifier.swift
//  Kuchi
//
//  Created by CypherPoet on 10/25/19.
// ✌️
//

import SwiftUI


extension Text {

    /// Allows a `ViewModifier` instance to be passed to a `View`'s `textStyle` modifier
    /// Inspiration from https://mecid.github.io/2019/08/28/composable-styling-in-swiftui/
    public func textStyle<Style: ViewModifier>(style: Style) -> some View {
        ModifiedContent(content: self, modifier: style)
    }
}
