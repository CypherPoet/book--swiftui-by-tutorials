//
//  FlightBoard.swift
//  MountainAirport
//
//  Created by CypherPoet on 11/1/19.
// ✌️
//

import SwiftUI


struct FlightBoard: View {
    @EnvironmentObject private var store: AppStore
    @ObservedObject private(set) var viewModel: FlightBoardViewModel
}


// MARK: - Computeds
extension FlightBoard {
    
}



// MARK: - Body
extension FlightBoard {

    var body: some View {
        
        List(viewModel.displayedFlights) { flightInfo in
            NavigationLink(destination: FlightBoardItemDetails(flightInfo: flightInfo)) {
                FlightBoardListItem(flightInfo: flightInfo)
            }
        }
    }
}


// MARK: - View Variables
extension FlightBoard {



}



// MARK: - Preview
struct FlightBoard_Previews: PreviewProvider {

    static var previews: some View {
        FlightBoard(
            viewModel: .init(
                flightData: SampleStore.default.state.flightInformationState.flightInfo,
                direction: .departure
            )
        )
            .accentColor(.pink)
            .environmentObject(SampleStore.default)
    }
}
