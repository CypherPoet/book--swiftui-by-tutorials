//
//  FlightBoard.swift
//  MountainAirport
//
//  Created by CypherPoet on 11/1/19.
// ✌️
//

import SwiftUI


struct FlightBoard: View {
    @ObservedObject private(set) var viewModel: FlightBoardViewModel

    var onFlightInfoSelected: ((FlightInformation) -> Void)? = nil
    
    @State private var selectedFlightInfoItem: FlightInformation?
}


// MARK: - Computeds
extension FlightBoard {}



// MARK: - Body
extension FlightBoard {

    var body: some View {
//
//        List(viewModel.displayedFlights) { flightInfo in
//            NavigationLink(destination: FlightBoardItemDetails(flightInfo: flightInfo)) {
//                FlightBoardListItem(flightInfo: flightInfo)
//            }
//        }
        
        List(viewModel.displayedFlights) { flightInfo in
            Button(action: {
                self.selectedFlightInfoItem = flightInfo
            }) {
                FlightBoardListItem(flightInfo: flightInfo)
            }
        }
        .sheet(item: $selectedFlightInfoItem) { flightInfo in
            FlightBoardItemDetails(flightInfo: flightInfo)
        }
    }
}


// MARK: - View Variables
extension FlightBoard {}



// MARK: - Preview
struct FlightBoard_Previews: PreviewProvider {

    static var previews: some View {
        
        NavigationView {
            FlightBoard(
                viewModel: .init(
                    flightData: SampleFlights.default,
                    direction: .departure
                )
            )
                .accentColor(.pink)
                .environmentObject(SampleStore.default)
        }
    }
}
