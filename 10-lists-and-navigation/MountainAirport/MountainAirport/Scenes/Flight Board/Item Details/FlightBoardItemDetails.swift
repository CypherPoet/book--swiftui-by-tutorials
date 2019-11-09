//
//  FlightBoardItemDetails.swift
//  MountainAirport
//
//  Created by CypherPoet on 11/2/19.
// ✌️
//

import SwiftUI


struct FlightBoardItemDetails: View {
    @Environment(\.presentationMode) var presentationMode
    
    let flightInfo: FlightInformation
    
    @State private var isShowingFlightHistory = false
}


// MARK: - Computeds
extension FlightBoardItemDetails {


}


// MARK: - Body
extension FlightBoardItemDetails {

    var body: some View {
        
        VStack(spacing: 32.0) {
            VStack(alignment: .leading) {

                HStack {
                    Text("\(flightInfo.airline) Flight \(flightInfo.number)")
                        .font(.largeTitle)
                    
                    Spacer()
                }
                    
                Text("\(flightInfo.direction == .arrival ? "From: " : "To: ")\(flightInfo.connectingAirport)")
                
                Text(flightInfo.flightBoardStatus)
                    .foregroundColor(Color(flightInfo.timelineColor))
            }
            .font(.headline)

            HStack {
                Spacer()
                Button(action: {
                    self.isShowingFlightHistory = true
                }) {
                    Text("Flight History")
                }
                Spacer()
            }
            
            Spacer()
        }
        .padding()
        .popover(isPresented: $isShowingFlightHistory, content: {
            Text("Flight History List")
        })
        .navigationBarItems(leading: EditButton())
    }
}


// MARK: - View Variables
extension FlightBoardItemDetails {


}



// MARK: - Preview
struct FlightBoardItemDetails_Previews: PreviewProvider {

    static var previews: some View {
        FlightBoardItemDetails(flightInfo: SampleFlightInformationState.default.flightInfo[0])
            .accentColor(.pink)
    }
}
