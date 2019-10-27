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
    @Published var usernameMessage: String = ""
    @Published var isFormValid = false
    
    
    init() {
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
    }
}


// MARK: - Publishers
extension RegistrationViewModel {
    
    var isUsernameValidPublisher: AnyPublisher<Bool, Never> {
        $username
            .debounce(for: .seconds(0.6), scheduler: DispatchQueue.main)
            .removeDuplicates()
            .map { $0.count >= 3 }
            .eraseToAnyPublisher()
    }
    
    
    var isFormValidPublisher: AnyPublisher<Bool, Never> {
        isUsernameValidPublisher
            .eraseToAnyPublisher()
    }
}


