//
//  ScoreView.swift
//  Kuchi
//
//  Created by CypherPoet on 10/22/19.
// ✌️
//

import SwiftUI


struct ScoreView: View {
    let score: Int
    let maxPossibleScore: Int
}


// MARK: - Body
extension ScoreView {

    var body: some View {
        HStack {
            Text("\(score)/\(maxPossibleScore)")
                .font(.caption)
                .padding(4)
            
            Spacer()
        }
    }
}


// MARK: - Preview
struct ScoreView_Previews: PreviewProvider {

    static var previews: some View {
        ScoreView(score: 90, maxPossibleScore: 100)
    }
}
