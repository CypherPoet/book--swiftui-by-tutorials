//
//  FirstVisitAwardView.swift
//  MountainAirport
//
//  Created by CypherPoet on 2/5/20.
// ✌️
//

import SwiftUI


struct FirstVisitAwardView {
    
    /// Scale for all content so that rotated squares don't exceed the view's  containing bounds
    private let contentScale: CGFloat = 0.7
}


// MARK: - View
extension FirstVisitAwardView: View {

    var body: some View {
        GeometryReader { geometry in
            ZStack {
                ForEach(0 ..< 3, id: \.self) { index in
                    self.backgroundRectangle
                        .rotationEffect(.radians(Double(index) * (-.pi / 3)))
                        .frame(
                            width: geometry.size.width * self.contentScale,
                            height: geometry.size.width * self.contentScale
                        )
                }
                
                Image(systemName: "airplane")
                    .resizable()
                    .rotationEffect(.radians(-.pi / 2))
                    .opacity(0.5)
                    .scaleEffect(self.contentScale)
            }
        }
    }
}


// MARK: - Computeds
extension FirstVisitAwardView {
}


// MARK: - View Variables
extension FirstVisitAwardView {
    
    private var backgroundRectangle: some View {
        Rectangle()
            .fill(backgroundRectangleGradient)
    }
    
    
    private var backgroundRectangleGradient: LinearGradient {
        LinearGradient(
            gradient: Gradient(
                colors: [
                    .green,
                    .blue,
                ]
            ),
            startPoint: .bottomLeading,
            endPoint: .topTrailing
        )
    }
}


// MARK: - Private Helpers
private extension FirstVisitAwardView {
}



// MARK: - Preview
struct FirstVisitAwardView_Previews: PreviewProvider {

    static var previews: some View {
        Group {
            FirstVisitAwardView()
                .environment(\.colorScheme, .dark)
                .frame(width: 200, height: 200)
            
            FirstVisitAwardView()
                .environment(\.colorScheme, .light)
                .frame(width: 200, height: 200)
        }
    }
}
