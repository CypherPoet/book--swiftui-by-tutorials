//
//  StackEntryView.swift
//  MountainAirport
//
//  Created by CypherPoet on 11/1/19.
// ✌️
//

import SwiftUI


struct StackEntryView: View {
    @EnvironmentObject private var store: AppStore
    
}


// MARK: - Computeds
extension StackEntryView {
    
    var flightInfo: [FlightInformation] {
        store.state.flightInformationState.flightInfo
    }
}


// MARK: - Body
extension StackEntryView {

    var body: some View {
        NavigationView {
            ZStack {
                Image(systemName: "airplane")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 250, height: 250)
                    .opacity(0.1)
                    .rotationEffect(.radians(-.pi / 2))
                
                VStack {
                    NavigationLink(destination: FlightBoard(direction: .arrival)) {
                        Text(FlightDirection.arrival.boardName)
                    }
                    NavigationLink(destination: FlightBoard(direction: .departure)) {
                        Text(FlightDirection.departure.boardName)
                    }
                    
                    Spacer()
                }
                .font(.title)
            }
            .navigationBarTitle("Mountain Airport")
            .navigationViewStyle(StackNavigationViewStyle())
        }
    }
}


// MARK: - View Variables
extension StackEntryView {



}



// MARK: - Preview
struct StackEntryView_Previews: PreviewProvider {
    
    static var previews: some View {
        Group {
            StackEntryView()
                .accentColor(.pink)
                .environmentObject(SampleStore.default)
            
            
            StackEntryView()
                .accentColor(.pink)
                .environmentObject(SampleStore.default)
                .previewDevice(PreviewDevice(rawValue: "iPhone 11"))
                .previewDisplayName("iPhone 11")
        }
    }
}
