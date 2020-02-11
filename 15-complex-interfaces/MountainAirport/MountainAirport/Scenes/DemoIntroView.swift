//
//  DemoIntroView.swift
//  MountainAirport
//
//  Created by CypherPoet on 2/11/20.
// ✌️
//

import SwiftUI


struct DemoIntroView {

}


// MARK: - View
extension DemoIntroView: View {

    var body: some View {
        VStack {
            Text("SwiftUI Grids")
                .font(.system(size: 90))
                .fontWeight(.semibold)
                .multilineTextAlignment(.center)
            
            Image(systemName: "square.grid.2x2.fill")
                .resizable()
                .frame(width: 120, height: 120)
                .foregroundColor(.pink)
        }
    }
}


// MARK: - Computeds
extension DemoIntroView {
}


// MARK: - View Variables
extension DemoIntroView {
}


// MARK: - Private Helpers
private extension DemoIntroView {
}



// MARK: - Preview
struct DemoIntroView_Previews: PreviewProvider {

    static var previews: some View {
        DemoIntroView()
    }
}
