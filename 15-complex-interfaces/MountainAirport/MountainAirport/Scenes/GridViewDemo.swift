//
//  GridViewDemo.swift
//  MountainAirport
//
//  Created by CypherPoet on 2/11/20.
// ✌️
//

import SwiftUI


struct GridViewDemo {
    @State private var isShowingContent = false
    
    private let numbers = Array(0...20)
    private let cellColors: [Color] = [.red, .orange, .yellow, .green, .blue, .purple, .pink, .white]
}


// MARK: - View
extension GridViewDemo: View {

    var body: some View {
        GridView(items: numbers, columnCount: 2) { (cellWidth, number) in
            Group {
                if self.isShowingContent {
                    VStack(spacing: 8) {
                        Rectangle()
                            .fill(self.cellColors[number % self.cellColors.count])
                            .frame(width: cellWidth * 0.9, height: cellWidth * 0.9)
                            .hueRotation(self.hueRotation(for: number))
                    }
                } else {
                    Color.clear
                }
            }
            .frame(width: cellWidth, height: cellWidth)
            .transition(
                AnyTransition
                    .move(edge: number % 2 == 0 ? .trailing : .leading)
//                    .move(edge: number % 2 == 0 ? .leading : .trailing)
                    .combined(with: .opacity)
            )
        }
        .onAppear {
            DispatchQueue.main.async {
                withAnimation(
                    Animation
                        .easeOut(duration: 0.65)
                        .delay(0.43)
                ) {
                    self.isShowingContent = true
                }
            }
        }
        .onDisappear {
            self.isShowingContent = false
        }
    }
}


// MARK: - Computeds
extension GridViewDemo {
}


// MARK: - View Variables
extension GridViewDemo {
}


// MARK: - Private Helpers
private extension GridViewDemo {
    func hueRotation(for number: Int) -> Angle {
//        .radians(Double(number) * 2 * .pi)
        .radians(0)
//        .radians(Double(number / 4) * .pi)
    }
}



// MARK: - Preview
struct GridViewDemo_Previews: PreviewProvider {

    static var previews: some View {
        GridViewDemo()
    }
}
