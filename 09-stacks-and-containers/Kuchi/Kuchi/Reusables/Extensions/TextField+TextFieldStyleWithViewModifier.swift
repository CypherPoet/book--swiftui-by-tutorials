//
//  TextField+TextFieldStyleWithViewModifier.swift
//  Kuchi
//
//  Created by CypherPoet on 10/25/19.
// ✌️
//

import SwiftUI


extension TextField {

    /// Allows a `ViewModifier` instance to be passed to a `View`'s `textFieldStyle` modifier
    /// Inspiration from https://mecid.github.io/2019/08/28/composable-styling-in-swiftui/
    public func textFieldStyle<Style: ViewModifier>(style: Style) -> some View {
        ModifiedContent(content: self, modifier: style)
    }
}
