//
//  Reducer.swift
//  Kuchi
//
//  Created by CypherPoet on 10/30/19.
// ✌️
//

import Foundation


struct Reducer<State, Action> {
    let reduce: (inout State, Action) -> Void
}
