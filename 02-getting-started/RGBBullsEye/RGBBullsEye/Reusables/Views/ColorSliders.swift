//
//  SliderSet.swift
//  RGBBullsEye
//
//  Created by Brian Sipple on 10/7/19.
//  Copyright © 2019 CypherPoet. All rights reserved.
//

import SwiftUI


struct ColorSliders: View {
    @Binding var currentRed: Double
    @Binding var currentGreen: Double
    @Binding var currentBlue: Double

    
    var body: some View {
        VStack(spacing: 12) {
            
            ColorSlider(
                component: .red,
                componentValue: $currentRed,
                label: Text("Current guess of the Red component")
            )
            
            ColorSlider(
                component: .green,
                componentValue: $currentGreen,
                label: Text("Current guess of the Green component")
            )
            
            ColorSlider(
                component: .blue,
                componentValue: $currentBlue,
                label: Text("Current guess of the Blue component")
            )
        }
    }
}

struct SliderSet_Previews: PreviewProvider {
    static var previews: some View {
        ColorSliders(
            currentRed: .constant(0.87),
            currentGreen: .constant(0.87),
            currentBlue: .constant(0.87)
        )
    }
}
