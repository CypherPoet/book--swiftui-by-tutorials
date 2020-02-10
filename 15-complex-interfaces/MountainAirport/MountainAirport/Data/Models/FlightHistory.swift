//
//  FlightHistory.swift
//  MountainAirport
//
//  Created by CypherPoet on 11/1/19.
// ✌️
//

import SwiftUI


public struct FlightHistory {
    public var day: Int
    public var flightId: Int
    public var date: Date
    public var direction: FlightDirection
    public var status: FlightStatus
    public var scheduledTime: Date
    public var actualTime: Date?
    
    
    public var shortDate: String {
        let formatter = DateFormatter()
        formatter.dateFormat = "MMM d"

        return formatter.string(from: date)
    }
    
    
    public var timeDifference: Int {
        guard let actual = actualTime else { return 60 }
            
        let diff = Calendar.current.dateComponents([.minute], from: scheduledTime, to: actual)
    
        return diff.minute!
    }
    
    
    public var flightDelayDescription: String {
        if status == .cancelled {
            return status.displayName
        }
        
        if timeDifference < 0 {
            return "Early by \(-timeDifference) minutes."
        } else if timeDifference == 0 {
            return "On time"
        } else {
            return "Late by \(timeDifference) minutes."
        }
    }
    
    
    public var delayColor: Color {
        if status == .cancelled {
            return Color.init(red: 0.5, green: 0, blue: 0)
        }
        
        if timeDifference <= 0 {
            return Color.green
        }
        
        if timeDifference <= 15 {
            return Color.yellow
        }
        
        return Color.red
    }
    
    
    public func calcOffset(_ width: CGFloat) -> CGFloat {
        return CGFloat(CGFloat(day-1) * width)
    }
}
