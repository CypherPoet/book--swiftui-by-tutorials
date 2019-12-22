//
//  CongratulationsView.swift
//  Kuchi
//
//  Created by CypherPoet on 10/21/19.
// ✌️
//

import SwiftUI


struct CongratulationsView: View {
    @Environment(\.presentationMode) var presentationMode
}


// MARK: - Body
extension CongratulationsView {

    var body: some View {
        
        VStack(spacing: 0) {
            Spacer()
            
            VStack(spacing: 10) {
                Text("🎉 Congratulations!")
                    .font(.largeTitle)
                
                UserBanner()
                
                Text("You're awesome!")
                    .font(.headline)
                    .foregroundColor(.gray)
            }
            
            Spacer()
            
            
            Button(action: {
                self.presentationMode.wrappedValue.dismiss()
            }) {
                Image(systemName: "gobackward")
                Text("Play Again")
            }
        }
        .padding(.vertical, 42)
    }
}


// MARK: - Preview
struct CongratulationsView_Previews: PreviewProvider {

    static var previews: some View {
        CongratulationsView()
            .environmentObject(SampleStore.withUserProfile)
    }
}
