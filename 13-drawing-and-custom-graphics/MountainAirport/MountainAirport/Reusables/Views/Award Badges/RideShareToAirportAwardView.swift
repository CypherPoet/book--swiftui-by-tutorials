//
//  RideShareToAirportAwardView.swift
//  MountainAirport
//
//  Created by CypherPoet on 2/5/20.
// ✌️
//

import SwiftUI


struct RideShareToAirportAwardView {

}


// MARK: - View
extension RideShareToAirportAwardView: View {

    var body: some View {
        GeometryReader { geometry in
            ZStack {
                self.roadPath(in: geometry)
                self.roadLinesPath(in: geometry)
                
                Image(systemName: "car.fill")
                    .resizable()
                    .scaleEffect(0.2)
                    .scaledToFit()
                    .foregroundColor(.pink)
                    .offset(x: -geometry.size.width * 0.15)
            }
        }
    }
}


// MARK: - Computeds
extension RideShareToAirportAwardView {
}


// MARK: - View Variables
extension RideShareToAirportAwardView {
}


// MARK: - Private Helpers
private extension RideShareToAirportAwardView {
    
    func roadPath(in geometry: GeometryProxy) -> Path {
        let frameSideLength = min(geometry.size.width, geometry.size.height)
        
        return Path { path in
            path.move(to: CGPoint(x: frameSideLength * 0.4, y: frameSideLength * 0.1))
            path.addLine(to: CGPoint(x: frameSideLength * 0.6, y: frameSideLength * 0.1))
            
            path.addLine(to: CGPoint(x: frameSideLength * 0.9, y: frameSideLength * 0.9))
            path.addLine(to: CGPoint(x: frameSideLength * 0.1, y: frameSideLength * 0.9))
        }
    }
    
    
    func roadLinesPath(in geometry: GeometryProxy) -> some View {
        let frameSideLength = min(geometry.size.width, geometry.size.height)
        let frameMidX = frameSideLength * 0.5
        
        return Path { path in
            path.move(to: CGPoint(x: frameMidX, y: 0))
            path.addLine(to: CGPoint(x: frameMidX, y: frameSideLength))
        }
        .stroke(
            Color.white,
            style: StrokeStyle(
                lineWidth: frameSideLength * 0.020,
                dash: [
                    frameSideLength / 20,
                    frameSideLength / 30,
                ],
                dashPhase: 0)
        )
    }
}



// MARK: - Preview
struct RideShareToAirportAwardView_Previews: PreviewProvider {

    static var previews: some View {
        RideShareToAirportAwardView()
            .frame(width: 250, height: 250)
    }
}
