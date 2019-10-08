//
//  ColorSlider.swift
//  RGBBullsEye
//
//  Created by Brian Sipple on 10/8/19.
//  Copyright © 2019 CypherPoet. All rights reserved.
//

import SwiftUI


struct ColorSlider: View {
    let component: Color
    @Binding var componentValue: Double

    let minValue: Double = 0
    let maxValue: Double = 255
    let label: Text

    
    var body: some View {
        Slider(
            value: $componentValue,
            in: 0.0...1.0,
            minimumValueLabel: Text(String(Int(minValue)))
                .foregroundColor(component)
                .fontWeight(.bold),
            maximumValueLabel: Text(String(Int(maxValue)))
                .foregroundColor(component)
                .fontWeight(.bold)
        ) {
            label
        }
    }
}


struct ColorSlider_Previews: PreviewProvider {
    static var previews: some View {
        ColorSlider(
            component: .red,
            componentValue: .constant(0.33),
            label: Text("Current guess of the Red component")
        )
    }
}
