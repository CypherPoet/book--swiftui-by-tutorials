//
//  RegistrationView.swift
//  Kuchi
//
//  Created by CypherPoet on 10/16/19.
// ✌️
//

import SwiftUI
import CypherPoetUIKit_KeyboardUtils


struct RegistrationView: View {
    @EnvironmentObject var userStore: UserStore
    @ObservedObject var keyboardHandler = KeyboardFollower()
    @ObservedObject var viewModel = RegistrationViewModel()
}
 

extension RegistrationView {
    
    var body: some View {
        Group {
            if userStore.isRegistered {
                WelcomeView(username: userStore.profile.name!)
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
        userStore.profile.name = viewModel.username
        userStore.persistProfile()
    }
    
    
    private var registrationForm: some View {
        VStack(spacing: 20) {
            
            TextField("Enter Your Name", text: $viewModel.username)
                .textFieldStyle(style: CustomRoundedTextFieldStyle())
                .autocapitalization(.none)
                .multilineTextAlignment(.center)
    
    
            Button(action: {
                self.registerUser()
            }) {
                HStack {
                    Image(systemName: "checkmark.circle")
                    Text("Register")
                        .font(.body)
                        .fontWeight(.bold)
                }
            }
            .buttonStyle(CustomFilledButtonStyle(fillColor: .purple))
            .disabled(!viewModel.isFormValid)
        }
        .padding()
    }
}


struct RegistrationView_Previews: PreviewProvider {
    static var previews: some View {
        RegistrationView()
            .environmentObject(sampleEmptyUserStore)
            .accentColor(.pink)
    }
}
