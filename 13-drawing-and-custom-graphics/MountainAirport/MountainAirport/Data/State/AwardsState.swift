//
//  AwardsState.swift
//  MountainAirport
//
//  Created by CypherPoet on 2/5/20.
// ✌️
//


import Foundation
import Combine
import CypherPoetSwiftUIKit_DataFlowUtils


struct AwardsState {
    var earnedAwards: [Award] = []
}



//enum AwardsSideEffect: SideEffect {
//
//}



enum AwardsAction {
    case earnedAwardsSet([Award])
}


// MARK: - Reducer
let awardsReducer: Reducer<AwardsState, AwardsAction> = Reducer(
    reduce: { state, action in
        switch action {
        case .earnedAwardsSet(let awards):
            state.earnedAwards = awards
        }
    }
)

