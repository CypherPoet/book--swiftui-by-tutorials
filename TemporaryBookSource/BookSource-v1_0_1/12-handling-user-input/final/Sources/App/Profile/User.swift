import Combine
import SwiftUI

final internal class User {
  
  @Published var isRegistered: Bool = false
  
  var profile: Profile = Profile() {
    willSet {
      willChange.send(self)
    }
  }
  
  internal let willChange = PassthroughSubject<User, Never>()
  
  init() {
    self.profile.name = ""
  }
  
  init(name: String) {
    self.profile.name = name
  }
}
