//
//  KeyboardFollower.swift
//  Kuchi
//
//  Created by CypherPoet on 10/25/19.
// ✌️
//

import Combine
import Foundation
import UIKit

final class KeyboardFollower: ObservableObject {
    private var subscriptions = Set<AnyCancellable>()
    
    
    @Published var keyboardHeight: CGFloat = 0.0
    @Published var isKeyboardVisible: Bool = false

    
    var keyboardChangeFrames: AnyPublisher<(begin: CGRect, end: CGRect), Never> {
        NotificationCenter.default
            .publisher(for: UIResponder.keyboardWillShowNotification)
            .compactMap { notification in
                guard
                    let userInfo = notification.userInfo,
                    let beginFrame = userInfo[UIResponder.keyboardFrameBeginUserInfoKey] as? CGRect,
                    let endFrame = userInfo[UIResponder.keyboardFrameEndUserInfoKey] as? CGRect
                else { return nil }
                
                return (begin: beginFrame, end: endFrame)
            }
            .eraseToAnyPublisher()
    }
    
    
    init() {
        keyboardChangeFrames
            .map { frames in
                frames.begin.minY > frames.end.minY
            }
            .assign(to: \.isKeyboardVisible, on: self)
            .store(in: &subscriptions)
        
        
        keyboardChangeFrames
            .map { frames in
                self.isKeyboardVisible ? frames.end.height : 0.0
            }
            .assign(to: \.keyboardHeight, on: self)
            .store(in: &subscriptions)
    }
}
