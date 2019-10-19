//
//  RegistrationView.swift
//  Kuchi
//
//  Created by CypherPoet on 10/16/19.
// ✌️
//

import SwiftUI


struct RegistrationView: View {
    @State private var userName: String = ""
    @State private var isRegistered = false
}
 

extension RegistrationView {
    
    var body: some View {
        Group {
            if isRegistered {
                WelcomeView(userName: userName)
            } else {
                registrationForm
            }
        }
    }
}


extension RegistrationView {
    
    private func registerUser() {
        userName = userName.trimmingCharacters(in: .whitespacesAndNewlines)
        
        if !userName.isEmpty {
            isRegistered = true
        }
    }
    
    
    private var registrationForm: some View {
        VStack(spacing: 20) {
            
            Text("Welcome to Kuchi")
                .font(.title)
                .animation(.spring())
            
            Spacer()
            
            TextField("Enter Your Name", text: $userName)
                .multilineTextAlignment(.center)
    
    
            Button(action: {
                self.registerUser()
            }) {
                HStack {
                    Image(systemName: "checkmark")
                    Text("Register")
                }
            }
            
            Spacer()
        }
        .padding()
    }
}


struct RegistrationView_Previews: PreviewProvider {
    static var previews: some View {
        RegistrationView()
    }
}
