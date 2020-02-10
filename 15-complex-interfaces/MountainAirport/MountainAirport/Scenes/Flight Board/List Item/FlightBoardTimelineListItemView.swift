//
//  FlightBoardTimelineListItemView.swift
//  MountainAirport
//
//  Created by CypherPoet on 2/10/20.
// ✌️
//

import SwiftUI


struct FlightBoardTimelineListItemView {
    @ObservedObject var viewModel: ViewModel
}


// MARK: - View
extension FlightBoardTimelineListItemView: View {

    var body: some View {
        VStack(alignment: .leading) {
            Text("On Time")
                .padding(4)
                .background(
                    RoundedRectangle(cornerRadius: 4)
                        .fill(viewModel.timelineColor)
                )
            
            Spacer()
            
            Text(viewModel.flightDirectionHeaderText)
                .font(.subheadline)
                .foregroundColor(.secondary)
        }
        .padding(.horizontal)
        .overlay(trackOverlay)
    }
}


// MARK: - Computeds
extension FlightBoardTimelineListItemView {
}


// MARK: - View Variables
extension FlightBoardTimelineListItemView {
    
    private var trackOverlay: some View {
        let trackOverflow: CGFloat = 12.0
        
        return GeometryReader { geometry in
            ZStack(alignment: .topLeading) {
                Rectangle()
                    .fill(Color.blue)
                    .frame(width: 2, height: geometry.size.height + trackOverflow)
                    .offset(x: 0, y: 12)
                
                Circle()
                    .stroke(Color.blue, style: StrokeStyle(lineWidth: 2))
                    .frame(width: 8)
                    .position(x: 1, y: 18 + (trackOverflow / 2))
                
                Circle()
                    .fill(Color(UIColor.systemBackground))
                    .frame(width: 6)
                    .position(x: 1, y: 18 + (trackOverflow / 2))
            }
        }
    }
}


// MARK: - Private Helpers
private extension FlightBoardTimelineListItemView {
}



// MARK: - Preview
struct FlightBoardTimelineListItem_Previews: PreviewProvider {

    static var previews: some View {
        GeometryReader { geometry in
            FlightBoardTimelineListItemView(
                viewModel: .init(
                    flightInfo: SampleFlightInformationState.default.flightInfo[0]
                )
            )
            .frame(width: geometry.size.width, height: 90)
            .border(Color.orange)
        }
        .accentColor(.pink)
    }
}
