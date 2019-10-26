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
    
    // TODO: Move to RegistrationViewModel
    @State private var userNameValue = ""
    
    @ObservedObject var keyboardHandler = KeyboardFollower()
}
 

extension RegistrationView {
    
    var body: some View {
        Group {
            if user.isRegistered {
                WelcomeView()
            } else {
                VStack {
                    WelcomeMessageView()
                        .foregroundColor(.pink)
                    
                    registrationForm
                }
                .background(WelcomeBackgroundImage())
                .padding(.bottom, keyboardHandler.keyboardHeight)
                .padding()
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
            
            TextField("Enter Your Name", text: $userNameValue)
                .textFieldStyle(style: CustomRoundedTextField())
                .multilineTextAlignment(.center)
    
    
            Button(action: {
                self.registerUser()
            }) {
                HStack {
                    Image(systemName: "checkmark.circle")
                    Text("Register")
                }
            }
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
