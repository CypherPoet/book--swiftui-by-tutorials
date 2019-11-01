//
//  QuestionView.swift
//  Kuchi
//
//  Created by CypherPoet on 10/22/19.
// ✌️
//

import SwiftUI


struct QuestionView: View {
    var question: String
}


// MARK: - Body
extension QuestionView {

    var body: some View {
        HStack {
            Text(question)
                .scaledSystemFont(size: 64)
                .allowsTightening(true)
                .padding(.horizontal)
                .allowsTightening(true)
                .foregroundColor(.pink)
                .lineLimit(5)
                .multilineTextAlignment(.center)
                .animation(.spring())
        }
    }
}


// MARK: - Preview
struct QuestionView_Previews: PreviewProvider {

    static var previews: some View {
        QuestionView(question: "ごめんなさい")
    }
}
