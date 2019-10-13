//
//  ContentView.swift
//  TVBullseye
//
//  Created by Brian Sipple on 10/13/19.
//  Copyright © 2019 CypherPoet. All rights reserved.
//

import SwiftUI
import Game


struct ContentView: View {
    @ObservedObject var game = BullsEyeGame()
    
    @State private var currentValue = 50.0
    @State private var currentValueString = ""
    @State private var isShowingAlert = false

    
    var body: some View {
        VStack {
            Text("Guess the Number")
            
            TextField(
                "Number between 1 and 100",
                text: $currentValueString,
                onEditingChanged: { _ in
                    self.currentValue = Double(self.currentValueString) ?? 50.0
                }
            )
            .padding(.horizontal, 200)
        
            HStack {
                Text("0")
                
                GeometryReader { geometry in
                    ZStack {
                        Rectangle()
                            .frame(height: 8)
                        Rectangle()
                            .frame(width: 8, height: 30)
                            .offset(
                                x: geometry.size.width * ((CGFloat(self.game.targetValue) / 100.0) - 0.5),
                                y: 0.0
                            )
                    }
                }
                
                Text("100")
            }
            .padding(.horizontal)
            
            
            Button(action: {
                self.isShowingAlert = true
                self.game.checkGuess(Int(self.currentValue))
            }) {
                Text("Check Guess")
            }
            .alert(isPresented: $isShowingAlert) {
                Alert(
                    title: Text("Your Score:"),
                    message: Text(String(game.scoreRound)),
                    dismissButton: .default(
                        Text("OK"),
                        action: {
                            self.game.startNewRound()
                            self.currentValueString = ""
                        }
                    )
                )
            }
            .padding()
            
            HStack {
                Text("Total Score: \(game.scoreTotal)")
                Text("Round: \(game.round)")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
