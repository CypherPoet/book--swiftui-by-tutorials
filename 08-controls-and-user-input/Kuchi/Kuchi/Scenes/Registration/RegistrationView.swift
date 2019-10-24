//
//  RegistrationView.swift
//  Kuchi
//
//  Created by CypherPoet on 10/16/19.
// ✌️
//

import SwiftUI


struct RegistrationView: View {
    @EnvironmentObject var user: User
    
    @State private var userNameValue = ""
}
 

extension RegistrationView {
    
    var body: some View {
        Group {
            if user.isRegistered {
                WelcomeView()
            } else {
                registrationForm
            }
        }
    }
}


extension RegistrationView {
    
    private func registerUser() {
        let userName = userNameValue.trimmingCharacters(in: .whitespacesAndNewlines)
        
        if !userName.isEmpty {
            user.profile = .init(name: userName)
            user.isRegistered = true
        }
    }
    
    
    private var registrationForm: some View {
        VStack(spacing: 20) {
            
            Text("Welcome to Kuchi")
                .font(.title)
                .animation(.spring())
            
            Spacer()
            
            TextField("Enter Your Name", text: $userNameValue)
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
            .environmentObject(sampleUser)
    }
}
