//
//  FlightGateDetailsView.swift
//  MountainAirport
//
//  Created by CypherPoet on 2/6/20.
// ✌️
//

import SwiftUI


struct FlightGateDetailsView {
    var viewModel: ViewModel
}


// MARK: - View
extension FlightGateDetailsView: View {

    var body: some View {
        VStack(alignment: .leading, spacing: 5) {
            Text(viewModel.flightGateActionText)
            Text(viewModel.scheduledTimeText)
            Text(viewModel.currentEstimatedTimeText)
            
            Image(viewModel.mapImageName)
        }
    }
}


// MARK: - Computeds
extension FlightGateDetailsView {
}


// MARK: - View Variables
extension FlightGateDetailsView {
}


// MARK: - Private Helpers
private extension FlightGateDetailsView {
}



// MARK: - Preview
struct FlightGateDetailsView_Previews: PreviewProvider {

    static var previews: some View {
        FlightGateDetailsView(
            viewModel: .init(
                flightInfo: SampleFlightInformationState.default.flightInfo[0]
            )
        )
        .accentColor(.pink)
    }
}
