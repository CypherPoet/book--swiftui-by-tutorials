/// Copyright (c) 2019 Razeware LLC
/// 
/// Permission is hereby granted, free of charge, to any person obtaining a copy
/// of this software and associated documentation files (the "Software"), to deal
/// in the Software without restriction, including without limitation the rights
/// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
/// copies of the Software, and to permit persons to whom the Software is
/// furnished to do so, subject to the following conditions:
/// 
/// The above copyright notice and this permission notice shall be included in
/// all copies or substantial portions of the Software.
/// 
/// Notwithstanding the foregoing, you may not use, copy, modify, merge, publish,
/// distribute, sublicense, create a derivative work, and/or sell copies of the
/// Software in any work that is designed, intended, or marketed for pedagogical or
/// instructional purposes related to programming, coding, application development,
/// or information technology.  Permission for such use, copying, modification,
/// merger, publication, distribution, sublicensing, creation of derivative works,
/// or sale is expressly withheld.
/// 
/// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
/// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
/// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
/// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
/// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
/// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
/// THE SOFTWARE.

import UIKit

enum FlightDirection {
    case arrival
    case departure
}

enum FlightStatus: String {
    case ontime = "On Time"
    case delayed = "Delayed"
    case cancelled = "Canceled"
    case landed = "Landed"
    case departed = "Departed"
}

class FlightInformation {
    public var id: Int
    public var airline: String
    public var number: String
    public var otherAirport: String
    public var scheduledTime: Date
    public var currentTime: Date?
    public var direction: FlightDirection
    public var status: FlightStatus
    public var gate: String
    
    public var scheduledTimeString: String {
        get {
            let timeFormatter = DateFormatter()
            timeFormatter.dateStyle = .none
            timeFormatter.timeStyle = .short
            return timeFormatter.string(from: scheduledTime)
        }
    }
    
    public var currentTimeString: String {
        get {
            guard let time = currentTime else { return "N/A" }
            let timeFormatter = DateFormatter()
            timeFormatter.dateStyle = .none
            timeFormatter.timeStyle = .short
            return timeFormatter.string(from: time)
        }
    }
    
    public var flightStatus: String {
        let now = Date()
        
        if status == .cancelled {
            return status.rawValue
        }
       
        if direction == .arrival && now > currentTime! {
            return "Arrived"
        }
        if direction == .departure && now > currentTime! {
            return "Departed"
        }
        
        return status.rawValue
    }
    
    init(recordId: Int, airline: String, number: String, connection: String, scheduledTime: Date, currentTime: Date?, direction: FlightDirection, status: FlightStatus, gate: String) {
        id = recordId
        self.airline = airline
        self.number = number
        otherAirport = connection
        self.scheduledTime = scheduledTime
        self.currentTime = currentTime
        self.direction = direction
        self.status = status
        self.gate = gate
    }

    static func generateFlights() -> [FlightInformation] {
        var flights = [FlightInformation]()
        let airlines = ["US", "Southeast", "Pacific", "Overland"]
        let airports = ["Charlotte", "Atlanta", "Chicago", "Dallas/Ft. Worth", "Detroit", "Miami", "Nashville", "New York-LGA", "Denver", "Phoenix"]
        let year = Calendar.current.component(.year, from: Date())
        let month = Calendar.current.component(.month, from: Date())
        let day = Calendar.current.component(.day, from: Date())

        for idx in 1...30 {
            let airline = airlines[Int.random(in: 0..<airlines.count)]
            let airport = airports[Int.random(in: 0..<airports.count)]
            let number = "\(Int.random(in: 100..<1000))"
            let t = Int.random(in: 0...1) % 2 == 0 ? "A" : "B"
            let gate = "\(t)\(Int.random(in: 1...5))"
            let direction: FlightDirection = idx % 2 == 0 ? .arrival : .departure
            let hour = Int(Float(idx) / 1.75) + 6
            let minute = Int.random(in: 0...11) * 5
            let scheduled = Calendar.current.date(from: DateComponents(year: year, month: month, day: day, hour: hour, minute: minute, second: 0))!
            let statusRoll = Int.random(in: 0...100)
            var status: FlightStatus
            var newTime: Date?
            if statusRoll < 67 {
                status = .ontime
                newTime = scheduled
            } else if statusRoll < 90 {
                status = .delayed
                newTime = scheduled.addingTimeInterval(Double(Int.random(in: 0...3600)))
            } else {
                status = .cancelled
                newTime = nil
            }
            let newFlight = FlightInformation(recordId: idx, airline: airline, number: number, connection: airport, scheduledTime: scheduled, currentTime: newTime, direction: direction, status: status, gate: gate)
            flights.append(newFlight)
        }
        
        return flights
    }
}
