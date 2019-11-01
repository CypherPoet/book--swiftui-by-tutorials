//
//  RegistrationView.swift
//  Kuchi
//
//  Created by CypherPoet on 10/16/19.
// ✌️
//

import SwiftUI
import CypherPoetUIKit_KeyboardUtils
import CypherPoetSwiftUIKit_DataFlowUtils


struct RegistrationView: View {
    @EnvironmentObject private var store: Store<AppState, AppAction>
    
    @ObservedObject var keyboardHandler = KeyboardFollower()
    @ObservedObject var viewModel = RegistrationViewModel()
}
 

extension RegistrationView {
    var isRegistered: Bool { store.state.userState.isRegistered }
}


extension RegistrationView {
    
    var body: some View {
        Group {
            if isRegistered {
                WelcomeView()
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
        guard let draftUserProfile = viewModel.draftUserProfile else { preconditionFailure() }
        
        store.send(.userAction(.register))
        
        if viewModel.shouldRememberUser {
            store.send(.userProfileAction(.persist(draftUserProfile)))
        }
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
            .environmentObject(SampleStore.empty)
            .accentColor(.pink)
    }
}
