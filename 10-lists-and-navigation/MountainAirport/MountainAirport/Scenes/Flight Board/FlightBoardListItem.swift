//
//  FlightBoardListItem.swift
//  MountainAirport
//
//  Created by CypherPoet on 11/2/19.
// ✌️
//

import SwiftUI


struct FlightBoardListItem: View {
    let flightInfo: FlightInformation
}


// MARK: - Computeds
extension FlightBoardListItem {


}


// MARK: - Body
extension FlightBoardListItem {

    var body: some View {
        HStack {
            Text("\(flightInfo.airline) \(flightInfo.number)")
                .frame(width: 120, alignment: .leading)
            
            Text("\(flightInfo.connectingAirport)")
                .frame(alignment: .leading)
            
            Spacer()
            
            Text("\(flightInfo.flightBoardStatus)")
                .frame(alignment: .trailing)
        }
    }
}


// MARK: - View Variables
extension FlightBoardListItem {


}



// MARK: - Preview
struct FlightBoardListItem_Previews: PreviewProvider {

    static var previews: some View {
        FlightBoardListItem(flightInfo: SampleFlightInformationState.default.flightInfo[0])
            .accentColor(.pink)
    }
}
