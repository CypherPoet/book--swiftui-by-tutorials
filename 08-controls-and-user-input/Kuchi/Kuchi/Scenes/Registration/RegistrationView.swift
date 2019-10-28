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
                VStack(spacing: 42) {
                    WelcomeMessageView()
                        .foregroundColor(.pink)
                    
                    registrationForm
                    registerButton
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
        userStore.settings.shouldPersistProfile = viewModel.shouldRememberUser
        userStore.saveNewUser()
    }
    
    
    private var registrationForm: some View {
        VStack(spacing: 22) {
            
            VStack(spacing: 8) {
                TextField("Enter Your Name", text: $viewModel.username)
                    .textFieldStyle(style: CustomRoundedTextFieldStyle())
                    .autocapitalization(.none)
                    .multilineTextAlignment(.center)
                
                HStack {
                    Spacer()
                    Text("\(viewModel.usernameLength)")
                        .font(.caption)
                        .padding(.trailing, 2)
                        .foregroundColor(viewModel.isUsernameValid ? .green : .red)
                }
            }
            
            Toggle(isOn: $viewModel.shouldRememberUser) {
                HStack {
                    Spacer()
                    Text("Remember Me")
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                }
            }
        }
        .padding()
    }
    
    
    private var registerButton: some View {
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
}


struct RegistrationView_Previews: PreviewProvider {
    static var previews: some View {
        RegistrationView()
            .environmentObject(sampleEmptyUserStore)
            .accentColor(.pink)
    }
}
