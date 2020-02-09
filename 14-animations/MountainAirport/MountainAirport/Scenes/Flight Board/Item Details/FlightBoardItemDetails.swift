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
    
    private let toggleButtonAnimationDuration: Double = 0.34
    
    @ObservedObject var viewModel: ViewModel
    
    @State private var isShowingGateDetails = false
}


// MARK: - Computeds
extension FlightBoardItemDetails {
    
    var gateDetailsEntranceAnimation: Animation {
        Animation.spring(
            response: 0.54,
            dampingFraction: 0.69,
            blendDuration: 0.2
        )
    }
    
    var gateDetailsExitAnimation: Animation {
        Animation.easeOut
    }
    
    
    var gateDetailsViewTransition: AnyTransition {
        .asymmetric(
            insertion: AnyTransition
                .move(edge: .bottom)
                .combined(with: .opacity)
                .combined(with: .scale(scale: 0, anchor: .top)),
            removal: AnyTransition
                .scale(scale: 1, anchor: .center)
                .combined(with: .opacity)
        )
        
    }
}


// MARK: - Body
extension FlightBoardItemDetails {

    var body: some View {
        VStack(alignment: .leading, spacing: 32.0) {
            infoHeaderSection
            dropdownToggleSection
            
//            FlightGateDetailsView(
//                viewModel: .init(flightInfo: viewModel.flightInfo)
//            )
//            .offset(x: isShowingGateDetails ? 0 : -UIScreen.main.bounds.width)
//            .animation(gateDetailsEntranceAnimation)
            
            if isShowingGateDetails {
                FlightGateDetailsView(
                    viewModel: .init(flightInfo: viewModel.flightInfo)
                )
                .transition(gateDetailsViewTransition)
            }
            
            Spacer()
            
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
            withAnimation(
                self.isShowingGateDetails ? self.gateDetailsExitAnimation : self.gateDetailsEntranceAnimation
            ) {
                self.isShowingGateDetails.toggle()
            }
        }) {
            HStack {
                Text(self.isShowingGateDetails ? "Hide Details" : "Show Details")
                    .fixedSize(horizontal: true, vertical: false)
                
                Spacer()
                
                Image(systemName: "chevron.up.square")
                    .scaleEffect(self.isShowingGateDetails ? 2 : 1.5)
                    .animation(.spring())
                    .rotationEffect(.radians(self.isShowingGateDetails ? 0 : .pi))
                    .animation(gateDetailsExitAnimation)
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
