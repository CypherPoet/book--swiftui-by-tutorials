//
//  FlightBoardContainerView.swift
//  MountainAirport
//
//  Created by CypherPoet on 11/2/19.
// ✌️
//

import SwiftUI


struct FlightBoardContainerView: View {
    @EnvironmentObject private var store: AppStore

    let direction: FlightDirection
    
    @State private var isShowingCancelledFlights = true
}


// MARK: - Computeds
extension FlightBoardContainerView {

    var flightData: [FlightInformation] {
        store.state.flightInformationState.flightInfo.filter { $0.direction == direction }
    }
}


// MARK: - Body
extension FlightBoardContainerView {

    var body: some View {
        FlightBoard(
            viewModel: FlightBoardViewModel(
                flightData: flightData,
                direction: direction,
                isShowingCancelledFlights: isShowingCancelledFlights
            )
        )
        .navigationBarItems(trailing: showCancelledFlightsButton)
        .navigationBarTitle(direction.boardName)
    }
}


// MARK: - View Variables
extension FlightBoardContainerView {

    private var showCancelledFlightsButton: some View {
        Button(action: {
            self.isShowingCancelledFlights.toggle()
        }) {
            Text("\(isShowingCancelledFlights ? "Hide" : "Show") Cancelled")
        }
    }
}



// MARK: - Preview
struct FlightBoardContainerView_Previews: PreviewProvider {

    static var previews: some View {
        FlightBoardContainerView(direction: .departure)
            .accentColor(.pink)
            .environmentObject(SampleStore.default)
    }
}
