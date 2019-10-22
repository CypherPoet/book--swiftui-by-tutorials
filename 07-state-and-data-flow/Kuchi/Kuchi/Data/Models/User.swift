//
//  User.swift
//  Kuchi
//
//  Created by CypherPoet on 10/19/19.
// ✌️
//

import Combine


final class User: ObservableObject {
    @Published var isRegistered: Bool = false
    @Published var profile = Profile()
    
    // 🤔 Not sure if its ideal to have a manual `willChange` instead of using
    // @Published, but this is the book example if we need to use it:

//    let willChange = PassthroughSubject<User, Never>()
//
//    var profile = Profile() {
//        willSet {
//            // 📝 The idea is that a subscriber can receive the `User` instance
//            // whenever the `profile` changes (`@Published` would send the `profile`).
//            //
//            // Again... skeptical, but rolling with it for now
//            willChange.send(self)
//        }
//    }
    
    
    init(name: String) {
        self.profile = Profile(name: name)
    }
}


#if DEBUG

let sampleUser = User(name: "CypherPoet")

#endif
