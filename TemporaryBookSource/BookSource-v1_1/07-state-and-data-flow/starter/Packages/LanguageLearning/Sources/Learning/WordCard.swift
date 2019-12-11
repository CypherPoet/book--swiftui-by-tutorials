import SwiftUI
import Combine

import Languages

/// Provides a word challenge to complete with an origin word and translation to use
/// for assessment (from `TranslatedWord`) and flags to use for measuring progress.
public struct WordCard {
  /// `TranslatedWord` to use for assessment (includes original word and translation).
  public let word: TranslatedWord
  
  /// Determines whether this challenge has been completed.
  public var completed: Bool = false
  
  /// Determines whether this challenge was completed successfully.
  public var succeeded: Bool = false
  
  /// Initializes a new `WordCard` from a given `TranslatedWord`.
  public init(from word: TranslatedWord) {
    self.word = word
  }
}

extension WordCard: Hashable {
  public static func == (lhs: WordCard, rhs: WordCard) -> Bool {
    lhs.word.original == rhs.word.original
  }
  
  public func hash(into hasher: inout Hasher) {
    word.original.hash(into: &hasher)
  }
}


