//
//  MainView.swift
//  RGBBullsEye
//
//  Created by Brian Sipple on 10/6/19.
//  Copyright © 2019 CypherPoet. All rights reserved.
//

import SwiftUI

struct MainView: View {
    @State private var guessedRed = Double.random(in: 0..<1)
    @State private var guessedGreen = Double.random(in: 0..<1)
    @State private var guessedBlue = Double.random(in: 0..<1)
    
    private let targetRed = Double.random(in: 0..<1)
    private let targetGreen = Double.random(in: 0..<1)
    private let targetBlue = Double.random(in: 0..<1)
    
    
    @State private var isShowingAnswerAlert: Bool = false
    
    
    var body: some View {
        VStack(spacing: 20) {
            
            HStack(spacing: 12) {
                VStack {
                    targetColor
                    Text("Match This Color")
                        .font(.callout)
                }
                
                VStack {
                    guessedColor
                    currentGuessLabel
                }
            }
            
            Button(action: {
                self.isShowingAnswerAlert = true
            }) {
               Text("Check Guess")
            }
            
            ColorSliders(
                currentRed: $guessedRed,
                currentGreen: $guessedGreen,
                currentBlue: $guessedBlue
            )
            .padding(.horizontal)
        }
        .alert(isPresented: $isShowingAnswerAlert) {
            Alert(
                title: Text("Alert"),
                message:
                    Text(answerMessage)
                    + Text("\n\nYou earned \(scoreForAnswer) points!")
                
            )
        }
        .padding()
    }
}


// MARK: - Computeds
extension MainView {
    var targetColor: Color { .init(red: targetRed, green: targetGreen, blue: targetBlue) }
    var guessedColor: Color { .init(red: guessedRed, green: guessedGreen, blue: guessedBlue) }
    
    
    var currentGuessLabel: Text {
        Text("R:")
            .foregroundColor(.red)
            .fontWeight(.bold)
        + Text(" \(Int(guessedRed * 255))  ")
            
        + Text("G:")
            .foregroundColor(.green)
            .fontWeight(.bold)
        + Text(" \(Int(guessedGreen * 255))  ")
            
        + Text("B: ")
            .foregroundColor(.blue)
            .fontWeight(.bold)
        + Text("\(Int(guessedBlue * 255))")
    }
    
    
    var answerMessage: String {
        """
        Target: (R: \(Int(targetRed * 255)), G: \(Int(targetGreen * 255)), B: \(Int(targetBlue * 255)))
        Guess: (R: \(Int(guessedRed * 255)), G: \(Int(guessedGreen * 255)), B: \(Int(guessedBlue * 255))
        """
    }
    
    
    var scoreForAnswer: Int {
        let redDiff = targetRed - guessedRed
        let greenDiff = targetGreen - guessedGreen
        let blueDiff = targetBlue - guessedBlue
        
        let diff = sqrt((redDiff * redDiff) + (greenDiff * greenDiff) + (blueDiff * blueDiff))
        
        return Int( ((1.0 - diff) * 100.0) + 0.5)
    }
}


struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
            .previewLayout(.iPhoneSELandscape)
    }
}
