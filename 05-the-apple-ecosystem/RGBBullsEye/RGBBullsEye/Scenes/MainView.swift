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
    
    @State private var isShowingAnswerAlert: Bool = false
    
    @ObservedObject var game = Game()
    @ObservedObject var timer = TimeCounter()
    
    
    var body: some View {
            VStack(spacing: 20) {
                
                ZStack(alignment: .center) {
                    HStack(spacing: 12) {
                        VStack {
                            game.targetColor
                            Text("Match This Color")
                                .font(.callout)
                        }
                        
                        VStack {
                            guessedColor
                            currentGuessLabel
                        }
                    }
                    
                    Text(String(timer.counter))
                        .font(.title)
                        .fontWeight(.bold)
                        .padding(12)
                        .background(Color.black.opacity(1))
                        .mask(Circle())
                        .foregroundColor(Color.white)
                }
                
                Button(action: {
                    self.timer.killTimer()
                    self.game.check(guess: (
                        red: self.guessedRed,
                        green: self.guessedGreen,
                        blue: self.guessedBlue
                    ))
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
                            + Text("\n\nYou earned \(game.scoreForRound) points!"),
                    dismissButton:
                        .default(Text("OK"), action: {
                            self.timer.restartTimer()
                            self.game.startNewRound()
                        }
                    )
                )
            }
            .padding()
            .environment(\.horizontalSizeClass, .compact)
    }
}


// MARK: - Computeds
extension MainView {
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
        Target: (R: \(Int(game.targetRed * 255)), G: \(Int(game.targetGreen * 255)), B: \(Int(game.targetBlue * 255)))
        Guess: (R: \(Int(guessedRed * 255)), G: \(Int(guessedGreen * 255)), B: \(Int(guessedBlue * 255))
        """
    }
}


struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        
        Group {
            MainView()
                .previewLayout(.iPhoneSELandscape)
            
            MainView()
        }
    }
}
