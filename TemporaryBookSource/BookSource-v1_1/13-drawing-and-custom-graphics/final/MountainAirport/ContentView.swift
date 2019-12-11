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

import SwiftUI

struct ContentView: View {
  var flightInfo: [FlightInformation] = FlightInformation.generateFlights()
  
  var body: some View {
    NavigationView {
      ZStack {
        Image(systemName: "airplane").resizable()
          .aspectRatio(contentMode: .fit)
          .frame(width: 250, height: 250, alignment: .center)
          .opacity(0.1).rotationEffect(.degrees(-90))
        VStack(alignment: .leading, spacing: 5) {
          NavigationLink(destination: FlightBoard(boardName: "Arrivals",
                  flightData: self.flightInfo
                    .filter { $0.direction == .arrival })) {
            Text("Arrivals")
          }
          NavigationLink(destination: FlightBoard(boardName: "Departures",
                flightData: self.flightInfo
                  .filter { $0.direction == .departure })) {
            Text("Departures")
          }
          NavigationLink(destination: AirportAwards()) {
            Text("Awards")
          }
          Spacer()
        }.font(.title).padding(20)
      Spacer()
      }.navigationBarTitle(Text("Mountain Airport"))
    }
  }
}


struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}

