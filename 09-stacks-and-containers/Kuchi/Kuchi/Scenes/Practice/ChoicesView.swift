//
//  ChoicesView.swift
//  Kuchi
//
//  Created by CypherPoet on 10/21/19.
// ✌️
//

import SwiftUI


struct ChoicesView: View {
    let choices: [String]
    let onSelect: ((String) -> Void)?
}


// MARK: - Body
extension ChoicesView {

    var body: some View {
        VStack {
            ForEach(choices, id: \.self) { choice in
                VStack {
                    Button(action: {
                        self.onSelect?(choice)
                    }, label: {
                        Text(choice)
                    })
                        .font(.title)
                        .padding()

                    Divider()
                }
            }
        }
    }
}


// MARK: - Preview
struct ChoicesView_Previews: PreviewProvider {

    static var previews: some View {
        ChoicesView(
            choices: ["Alpha", "Bravo", "Charilie"],
            onSelect: { _ in }
        )
    }
}
