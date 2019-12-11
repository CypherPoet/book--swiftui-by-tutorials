/// Copyright (c) 2019 Razeware LLC
///
/// Permission is hereby granted, free of charge, to any person obtaining a copy
/// of this software and associated documentation files (the "Software"), to deal
/// in the Software without restriction, including without limitation the rights
/// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
/// copies of the Software, and to permit persons to whom the Software is
/// furnished to do so, subject to the following conditions:
///
/// The above copyright notice and this permission notice shall be included in
/// all copies or substantial portions of the Software.
///
/// Notwithstanding the foregoing, you may not use, copy, modify, merge, publish,
/// distribute, sublicense, create a derivative work, and/or sell copies of the
/// Software in any work that is designed, intended, or marketed for pedagogical or
/// instructional purposes related to programming, coding, application development,
/// or information technology.  Permission for such use, copying, modification,
/// merger, publication, distribution, sublicensing, creation of derivative works,
/// or sale is expressly withheld.
///
/// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
/// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
/// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
/// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
/// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
/// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
/// THE SOFTWARE.

import SwiftUI

struct RegisterView : View {
  @EnvironmentObject var userManager: UserManager
  @ObservedObject var keyboardHandler: KeyboardFollower
  @State var name: String = ""

  init(keyboardHandler: KeyboardFollower) {
    self.keyboardHandler = keyboardHandler
  }

  var body: some View {
    VStack(content: {
      WelcomeMessageView()
      
      TextField("Type your name...", text: $name)
        .bordered()

      HStack {
        Spacer()
        Text("\(name.count)")
          .font(.caption)
          .foregroundColor(userManager.isUserNameValid(name) ? .green : .red)
          .padding(.trailing)
      }
      .padding(.bottom)


      HStack {
        Spacer()
      
        Toggle(isOn: $userManager.settings.rememberUser) {
          Text("Remember me")
            .font(.subheadline)
            .multilineTextAlignment(.trailing)
            .foregroundColor(.gray)
        }
      }

      Button(action: self.registerUser) {
        HStack {
          Image(systemName: "checkmark")
            .resizable()
            .frame(width: 16, height: 16, alignment: .center)
          Text("OK")
            .font(.body)
            .bold()
        }
      }
      .bordered()
      .disabled(!userManager.isUserNameValid(name))
    })
      .padding(.bottom, keyboardHandler.keyboardHeight)
      .background(WelcomeBackgroundImage())
      .padding()
      .onAppear { self.keyboardHandler.subscribe() }
      .onDisappear { self.keyboardHandler.unsubscribe() }
  }
}

// MARK: - Event Handlers
extension RegisterView {
  func registerUser() {
    userManager.profile.name = name

    if userManager.settings.rememberUser {
      userManager.persistProfile()
    } else {
      userManager.clear()
    }
    
    userManager.persistSettings()
  }
}

struct RegisterView_Previews: PreviewProvider {
  static let user = UserManager(name: "Ray")

  static var previews: some View {
    RegisterView(keyboardHandler: KeyboardFollower())
      .environmentObject(user)
  }
}
