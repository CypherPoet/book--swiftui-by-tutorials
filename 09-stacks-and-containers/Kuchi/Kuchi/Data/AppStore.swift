//
//  AppStore.swift
//  Kuchi
//
//  Created by CypherPoet on 10/29/19.
// ✌️
//

import Foundation
import Combine



//enum AppSideEffect: SideEffect {
//    case somethingAsync
//
//    func mapToAction() -> AnyPublisher<AppAction, Never> {
//        switch self {
//        case .somethingAsync:
//        }
//    }
//}



final class Store<AppState, AppAction>: ObservableObject {
    @Published private(set) var state: AppState
    
    private let appReducer: Reducer<AppState, AppAction>
    private var cancellables: Set<AnyCancellable> = []
    
    
    init(initialState: AppState, appReducer: Reducer<AppState, AppAction>) {
        self.state = initialState
        self.appReducer = appReducer
    }
    
    
    func send(_ action: AppAction) {
        appReducer.reduce(&state, action)
    }
    
    
    /// Asynchronously sends an action after mapping it out of a side effect
    func send<S: SideEffect>(_ sideEffect: S) where S.Action == AppAction {
        sideEffect
            .mapToAction()
            .receive(on: DispatchQueue.main)
            .sink(receiveValue: { [weak self] (appAction) in
                // https://twitter.com/thesunshinejr/status/1186704338686750722
                self?.send(appAction)
            })
            .store(in: &cancellables)
    }
}


// MARK: - Reducer
let appReducer: Reducer<AppState, AppAction> = Reducer(reduce: { appState, action in
    switch action {
    case let .userAction(action):
        userReducer.reduce(&appState.userState, action)
    case let .userProfileAction(action):
        userProfileReducer.reduce(&appState.userProfileState, action)
    }
})
