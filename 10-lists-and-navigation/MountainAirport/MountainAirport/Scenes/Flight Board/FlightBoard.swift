//
//  FlightBoard.swift
//  MountainAirport
//
//  Created by CypherPoet on 11/1/19.
// ✌️
//

import SwiftUI


struct FlightBoard: View {
    let direction: FlightDirection
}


// MARK: - Body
extension FlightBoard {

    var body: some View {
        Text(direction.boardName)
            .font(.largeTitle)
    }
}


// MARK: - View Variables
extension FlightBoard {



}



// MARK: - Preview
struct FlightBoard_Previews: PreviewProvider {

    static var previews: some View {
        FlightBoard(direction: .departure)
            .accentColor(.pink)
            .environmentObject(SampleStore.default)
    }
}
