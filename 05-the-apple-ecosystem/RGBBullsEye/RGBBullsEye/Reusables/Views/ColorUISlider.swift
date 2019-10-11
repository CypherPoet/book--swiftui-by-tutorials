//
//  ColorUISlider.swift
//  RGBBullsEye
//
//  Created by Brian Sipple on 10/10/19.
//  Copyright © 2019 CypherPoet. All rights reserved.
//

import SwiftUI
import UIKit


struct ColorUISlider: UIViewRepresentable {
    typealias UIViewType = UISlider
    
    var color: UIColor
    @Binding var currentValue: Double
    
    
    func makeUIView(context: UIViewRepresentableContext<ColorUISlider>) -> UISlider {
        let slider = UISlider(frame: .zero)

        slider.value = sliderValue
        slider.thumbTintColor = color
        slider.minimumTrackTintColor = color.withAlphaComponent(0.4)

        slider.addTarget(
            context.coordinator,
            action: #selector(Coordinator.sliderValueChanged(_:)),
            for: .valueChanged
        )
        
        return slider
    }
    
    
    func updateUIView(_ slider: UISlider, context: UIViewRepresentableContext<ColorUISlider>) {
        slider.value = sliderValue
    }
}


// MARK: - Computeds
extension ColorUISlider {
    private var sliderValue: Float { Float(currentValue) }
}


// MARK: - Coordinator
extension ColorUISlider {
    
    class Coordinator: NSObject {
        var colorValue: Binding<Double>
        
        
        init(colorValue: Binding<Double>) {
            self.colorValue = colorValue
        }
        
        
        /// Keeps the SwiftUI binding in sync with the sliders value when the latter changes
        @objc func sliderValueChanged(_ sender: UISlider) {
            colorValue.wrappedValue = Double(sender.value)
        }
    }

    
    /// Creates a coordinator that holds on to our SwiftUI `currentValue` binding
    func makeCoordinator() -> ColorUISlider.Coordinator {
        .init(colorValue: $currentValue)
    }
}


struct ColorUISlider_Previews: PreviewProvider {
    static var previews: some View {
        ColorUISlider(color: .systemRed, currentValue: .constant(0.88))
    }
}
