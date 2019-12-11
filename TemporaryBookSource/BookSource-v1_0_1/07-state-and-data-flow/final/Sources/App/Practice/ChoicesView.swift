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

import Assessing
import Learning

/// Displays the view for the choices available for the practice
/// question.
struct ChoicesView {
  
  // MARK: - Private Constants
  
  private let answer: (_ answer: String) -> Void
  
  private let answers: [String]
  
  // MARK: - Initializers
  
  init(onSelected action: @escaping (_ answer: String) -> Void, answers: [String]) {
    self.answer = action
    self.answers = answers
  }
  
}

extension ChoicesView: View {
  
  var body: some View {
    VStack(spacing: 25) {
      ForEach(0 ..< self.answers.count) { index in
        Button(action: {
          self.answer(self.answers[index])
        }, label: {
          Text(self.answers[index])
            .font(.title)
        })
        Divider()
      }
    }
  }
  
}

#if DEBUG
struct ChoicesView_Previews: PreviewProvider {
  static var previews: some View {
    ChoicesView(onSelected: {_ in }, answers: [String]())
  }
}
#endif
