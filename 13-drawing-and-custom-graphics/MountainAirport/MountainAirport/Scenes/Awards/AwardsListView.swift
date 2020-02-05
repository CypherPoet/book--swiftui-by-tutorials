//
//  AwardsListView.swift
//  MountainAirport
//
//  Created by CypherPoet on 2/5/20.
// ✌️
//

import SwiftUI


struct AwardsListView {
    @ObservedObject var viewModel: ViewModel
}


// MARK: - View
extension AwardsListView: View {

    var body: some View {
        List(viewModel.awards) { award in
            
            VStack {
                FirstVisitAwardView()
                    .frame(width: 250, height: 250)
                
                Text(award.title)
            }
        }
    }
}


// MARK: - Computeds
extension AwardsListView {
}


// MARK: - View Variables
extension AwardsListView {
}


// MARK: - Private Helpers
private extension AwardsListView {
}



// MARK: - Preview
struct AwardsListView_Previews: PreviewProvider {

    static var previews: some View {
        AwardsListView(
            viewModel: .init(awardsState: SampleAwardsState.default)
        )
    }
}
