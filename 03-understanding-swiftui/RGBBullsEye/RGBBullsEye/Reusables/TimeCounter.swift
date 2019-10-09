//
//  TimeCounter.swift
//  RGBBullsEye
//
//  Created by Brian Sipple on 10/9/19.
//  Copyright © 2019 CypherPoet. All rights reserved.
//

import Foundation
import Combine


final class TimeCounter: ObservableObject {
    let objectWillChange = PassthroughSubject<TimeCounter, Never>()
    
    var timer: Timer?
    var counter = 0
    
    
    @objc func updateCounter() {
        counter += 1
        objectWillChange.send(self)
    }
    
    
    init() {
        timer = Timer.scheduledTimer(
            timeInterval: 1,
            target: self,
            selector: #selector(TimeCounter.updateCounter),
            userInfo: nil,
            repeats: true
        )
    }
    
    
    func killTimer() {
        timer?.invalidate()
        timer = nil
    }
}
