//
//  AirportLoungeAwardView.swift
//  MountainAirport
//
//  Created by CypherPoet on 2/5/20.
// ✌️
//

import SwiftUI


struct AirportLoungeAwardView {
    
}


// MARK: - View
extension AirportLoungeAwardView: View {

    var body: some View {
        GeometryReader { geometry in
            self.shapeBackground(in: geometry)
                .fill(self.backgroundGradient(in: geometry))
                .frame(width: geometry.size.width, height: geometry.size.width)
                .overlay(self.arcOverlaysPath(in: geometry))
        }
    }
}


// MARK: - Computeds
extension AirportLoungeAwardView {
}


// MARK: - View Variables
extension AirportLoungeAwardView {
}


// MARK: - Private Helpers
private extension AirportLoungeAwardView {
    
    func shapeBackground(in geometry: GeometryProxy) -> Path {
        let frameSideLength = min(geometry.size.width, geometry.size.height)
        let frameMidLength = frameSideLength * 0.5

        let contentMinX = frameSideLength * 0.1
        let contentMaxX = frameSideLength * 0.9
        
        let contentMinY = frameSideLength * 0.1
        let contentMaxY = frameSideLength * 0.9
        

        return Path { path in
            path.move(to: CGPoint(x: frameMidLength, y: contentMinY))
            
            path.addQuadCurve(
                to: CGPoint(x: contentMaxX, y: frameMidLength),
                control: CGPoint(x: frameSideLength, y: 0)
            )
            
            path.addQuadCurve(
                to: CGPoint(x: frameMidLength, y: contentMaxY),
                control: CGPoint(x: frameSideLength, y: frameSideLength)
            )
            
            path.addQuadCurve(
                to: CGPoint(x: contentMinX, y: frameMidLength),
                control: CGPoint(x: 0, y: frameSideLength)
            )
            
            
            path.addQuadCurve(
                to: CGPoint(x: frameMidLength, y: contentMinY),
                control: CGPoint(x: 0, y: 0)
            )
        }
    }
    
    
    func arcOverlaysPath(in geometry: GeometryProxy) -> some View {
        let frameSideLength = min(geometry.size.width, geometry.size.height)

        let contentMinX = frameSideLength * 0.1
        let contentMaxX = frameSideLength * 0.9
        
        let contentMinY = frameSideLength * 0.1
        let contentMaxY = frameSideLength * 0.9

        let arcRadius = frameSideLength * 0.5
        
        
        return Path { path in
            path.addArc(
                center: .init(x: contentMinX, y: contentMinY),
                radius: arcRadius,
                startAngle: .radians(.pi * 0.5),
                endAngle: .radians(0),
                clockwise: true
            )
            
            path.addArc(
                center: .init(x: contentMaxX, y: contentMinY),
                radius: arcRadius,
                startAngle: .radians(.pi * 1.0),
                endAngle: .radians(.pi * 0.5),
                clockwise: true
            )
            
            path.addArc(
                center: .init(x: contentMaxX, y: contentMaxY),
                radius: arcRadius,
                startAngle: .radians(.pi * 1.5),
                endAngle: .radians(.pi * 1.0),
                clockwise: true
            )
            
            path.addArc(
                center: .init(x: contentMinX, y: contentMaxY),
                radius: arcRadius,
                startAngle: .radians(0),
                endAngle: .radians(.pi * 1.5),
                clockwise: true
            )
            
            path.closeSubpath()
        }
        .stroke(Color.orange, lineWidth: 4)
    }
    
    
    func backgroundGradient(in geometry: GeometryProxy) -> RadialGradient {
        RadialGradient(
            gradient: Gradient(
                colors: [
                    .white,
                    .yellow
                ]
            ),
            center: .center,
            startRadius: geometry.size.width * 0.05,
            endRadius: geometry.size.width * 0.6
        )
    }
}



// MARK: - Preview
struct AirportLoungeAwardView_Previews: PreviewProvider {

    static var previews: some View {
        AirportLoungeAwardView()
    }
}
