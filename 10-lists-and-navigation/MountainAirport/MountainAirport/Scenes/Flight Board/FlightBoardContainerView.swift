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
                direction: direction,
                flightData: flightData
            )
        )
    }
}


// MARK: - View Variables
extension FlightBoardContainerView {


}



// MARK: - Preview
struct FlightBoardContainerView_Previews: PreviewProvider {

    static var previews: some View {
        FlightBoardContainerView(direction: .departure)
            .accentColor(.pink)
            .environmentObject(SampleStore.default)
    }
}
