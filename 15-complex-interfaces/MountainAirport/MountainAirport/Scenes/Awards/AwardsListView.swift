//
//  AwardsListView.swift
//  MountainAirport
//
//  Created by CypherPoet on 2/5/20.
// ✌️
//

import SwiftUI
import CypherPoetSwiftUIKit


struct AwardsListView {
    @ObservedObject var viewModel: ViewModel
}


// MARK: - View
extension AwardsListView: View {

    var body: some View {
        VStack(spacing: 20) {
            ForEach(viewModel.awards) { award in
                VStack(spacing: 8) {
                    award.badgeView
                        .frame(width: 250, height: 250)
                    
                    Text(award.title)
                        .font(.headline)
                }
            }
        }
        .embedInScrollView(axes: .vertical, showsIndicators: false)
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
