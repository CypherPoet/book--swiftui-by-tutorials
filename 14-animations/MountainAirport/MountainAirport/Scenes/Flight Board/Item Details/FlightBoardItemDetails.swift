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
    
    @ObservedObject var viewModel: ViewModel
    
    @State private var isShowingDetailsDropdown = true
}


// MARK: - Computeds
extension FlightBoardItemDetails {}


// MARK: - Body
extension FlightBoardItemDetails {

    var body: some View {
        VStack(alignment: .leading, spacing: 32.0) {
            infoHeaderSection
            dropdownToggleSection
            
            if isShowingDetailsDropdown {
                FlightGateDetailsView(
                    viewModel: .init(flightInfo: viewModel.flightInfo)
                )
            }
        }
        .padding()
        .navigationBarItems(leading: EditButton())
    }
}


// MARK: - View Variables
extension FlightBoardItemDetails {

    private var infoHeaderSection: some View {
        VStack(alignment: .leading) {
            Text(viewModel.flightHeaderHeadlineText)
                .font(.largeTitle)
            
            Text(viewModel.flightDirectionHeaderText)
            
            Text(viewModel.flightStatusText)
                .foregroundColor(viewModel.flightStatusTextColor)
        }
        .font(.headline)
    }
    
    
    private var dropdownToggleSection: some View {
        Button(action: {
            self.isShowingDetailsDropdown = true
        }) {
            HStack {
                Text(self.isShowingDetailsDropdown ? "Hide Details" : "Show Details")
                
                Spacer()
                
                Image(systemName: "chevron.up.square")
                    .resizable()
                    .scaledToFit()
                    .rotationEffect(.radians(self.isShowingDetailsDropdown ? 0 : .pi))
                    .animation(.easeInOut(duration: 0.4))
                    .frame(width: 40, height: 40)
            }
        }
    }
}



// MARK: - Preview
struct FlightBoardItemDetails_Previews: PreviewProvider {

    static var previews: some View {
        FlightBoardItemDetails(
            viewModel: .init(
                flightInfo: SampleFlightInformationState.default.flightInfo[0]
            )
        )
        .accentColor(.pink)
    }
}
