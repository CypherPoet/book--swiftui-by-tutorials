//
//  AwardsGridView.swift
//  MountainAirport
//
//  Created by CypherPoet on 2/5/20.
// ✌️
//

import SwiftUI
import CypherPoetSwiftUIKit


struct AwardsGridView {
    var viewModel: ViewModel
    
    @State private var isShowingContent = false
}


// MARK: - View
extension AwardsGridView: View {

    var body: some View {
        GridView(items: viewModel.awards, columnCount: 2) { (cellWidth, award) in
            Group {
                if self.isShowingContent {
                    VStack(spacing: 8) {
                        award.badgeView
                            .frame(width: cellWidth * 0.7, height: cellWidth * 0.7)
                        
                        Text(award.title)
                            .font(.headline)
                    }
                } else {
                    Color.clear
                }
            }
            .frame(width: cellWidth, height: cellWidth)
            .transition(
                AnyTransition
                    .move(edge: Edge.allCases.randomElement()!)
                    .combined(with: .opacity)
            )
        }
        .onAppear {
            DispatchQueue.main.async {
                withAnimation(Animation.easeOut(duration: 0.4)) {
                    self.isShowingContent = true
                }
            }
        }
        .onDisappear {
            self.isShowingContent = false
        }
    }
}


// MARK: - Computeds
extension AwardsGridView {
}


// MARK: - View Variables
extension AwardsGridView {
}


// MARK: - Private Helpers
private extension AwardsGridView {
}



// MARK: - Preview
struct AwardsGridView_Previews: PreviewProvider {

    static var previews: some View {
        AwardsGridView(
            viewModel: .init(awardsState: SampleAwardsState.default)
        )
    }
}
