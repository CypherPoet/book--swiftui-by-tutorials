//
//  ColorSlider.swift
//  RGBBullsEye
//
//  Created by Brian Sipple on 10/8/19.
//  Copyright © 2019 CypherPoet. All rights reserved.
//

import SwiftUI


struct ColorSlider: View {
    /// The color corresponding to this slider's color "channel" (e.g.: Red, Green, or Blue)
    let channelColor: UIColor
    
    @Binding var componentValue: Double

    let minValue: Double = 0
    let maxValue: Double = 255
    let label: Text

    
    var body: some View {
        HStack {
            Text("0")
                .fontWeight(.bold)
                .foregroundColor(Color(channelColor))
            
            ColorUISlider(color: channelColor, currentValue: $componentValue)
            
            Text("255")
                .fontWeight(.bold)
                .foregroundColor(Color(channelColor))
        }
    }
}


struct ColorSlider_Previews: PreviewProvider {
    static var previews: some View {
        ColorSlider(
            channelColor: .systemRed,
            componentValue: .constant(0.33),
            label: Text("Current guess of the Red component")
        )
    }
}
