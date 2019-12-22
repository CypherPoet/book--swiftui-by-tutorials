//
//  RegistrationViewModel.swift
//  Kuchi
//
//  Created by CypherPoet on 10/26/19.
// ✌️
//

import Foundation
import Combine


final class RegistrationViewModel: ObservableObject {
    private var subscriptions = Set<AnyCancellable>()
    
    @Published var username: String = ""
    @Published var usernameLength: Int = 0
    @Published var isUsernameValid = false
    @Published var usernameMessage: String = ""
    
    @Published var shouldRememberUser = false
    
    @Published var isFormValid = false
    
    @Published var draftUserProfile: UserProfile?
    
    
    init() {
        setupSubscriptions()
    }
}


// MARK: - Publishers
extension RegistrationViewModel {
    
    var usernameLengthPublisher: AnyPublisher<Int, Never> {
        $username
            .map { $0.count }
            .eraseToAnyPublisher()
    }
    
    
    var isUsernameValidPublisher: AnyPublisher<Bool, Never> {
        $username
            .debounce(for: .seconds(0.6), scheduler: DispatchQueue.main)
            .removeDuplicates()
            .combineLatest(usernameLengthPublisher)
            .map { (_, count) in count >= 3 }
            .eraseToAnyPublisher()
    }
    
    
    var isFormValidPublisher: AnyPublisher<Bool, Never> {
        isUsernameValidPublisher
            .eraseToAnyPublisher()
    }
    
    
    var draftUserProfilePublisher: AnyPublisher<UserProfile?, Never> {
        isFormValidPublisher
            .map { isValid in
                guard isValid else { return nil }
                
                return UserProfile(name: self.username)
            }
            .eraseToAnyPublisher()
    }
}



// MARK: - Private Helpers
private extension RegistrationViewModel {
    
    func setupSubscriptions() {
        usernameLengthPublisher
            .receive(on: DispatchQueue.main)
            .assign(to: \.usernameLength, on: self)
            .store(in: &subscriptions)

        
        isUsernameValidPublisher
            .receive(on: DispatchQueue.main)
            .assign(to: \.isUsernameValid, on: self)
            .store(in: &subscriptions)
        
        
        isUsernameValidPublisher
            .receive(on: DispatchQueue.main)
            .map({ isValid in
                isValid ? "" : "Usernames must be at least 3 characters long."
            })
            .assign(to: \.usernameMessage, on: self)
            .store(in: &subscriptions)
        
        
        isFormValidPublisher
            .receive(on: DispatchQueue.main)
            .assign(to: \.isFormValid, on: self)
            .store(in: &subscriptions)
        
        
        draftUserProfilePublisher
            .receive(on: DispatchQueue.main)
            .assign(to: \.draftUserProfile, on: self)
            .store(in: &subscriptions)
    }
}
