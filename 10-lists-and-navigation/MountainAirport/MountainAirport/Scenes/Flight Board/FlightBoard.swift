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
        
        List(viewModel.flightData) { flightInfo in
            FlightBoardListItem(flightInfo: flightInfo)
        }
        .navigationBarTitle(viewModel.direction.boardName)
    }
}


// MARK: - View Variables
extension FlightBoard {



}



// MARK: - Preview
struct FlightBoard_Previews: PreviewProvider {

    static var previews: some View {
        FlightBoard(
            viewModel: .init(direction: .departure)
        )
            .accentColor(.pink)
            .environmentObject(SampleStore.default)
    }
}
