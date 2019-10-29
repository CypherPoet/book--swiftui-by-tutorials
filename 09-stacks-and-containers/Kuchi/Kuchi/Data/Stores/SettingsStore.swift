//
//  SettingsStore.swift
//  Kuchi
//
//  Created by CypherPoet on 10/29/19.
// ✌️
//

import Foundation
import Combine
import CypherPoetCore_PropertyWrappers


final class SettingsStore: ObservableObject {
    let objectWillChange = PassthroughSubject<Void, Never>()
    private var didChangeCancellable: AnyCancellable?
    
    
    @UserDefault(UserDefaultsKey.shouldPersistProfile, defaultValue: true)
    var shouldPersistProfile: Bool

    
    init() {
        didChangeCancellable = NotificationCenter
            .default
            .publisher(for: UserDefaults.didChangeNotification)
            .map({ _ in })
            .receive(on: DispatchQueue.main)
            .subscribe(objectWillChange)
    }
}


#if DEBUG

let sampleSettingsStore = SettingsStore()

#endif
