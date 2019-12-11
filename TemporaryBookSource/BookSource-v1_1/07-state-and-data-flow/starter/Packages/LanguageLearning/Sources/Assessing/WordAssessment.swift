import Learning

/// Model used to assess the learner's word knowledge. Utilizes `WordCard`
/// and therefore`TranslatedWord`.
public struct WordAssessment {
  /// The word challenge (original word and translation) to evaluate.
  public var card: WordCard
  
  /// The potential answers for the given `WordCard`.
  public let answers: [String]
  
  /// Initialises a new word for assessment from a `WordCard` and multiple potential
  /// answers.
  ///  - parameters:
  ///     - challenge: `WordCard` based on `TranslatedWord` to assess.
  ///     - answers: A list (`Array`) of answers to present to the learner for assessment.
  public init(card: WordCard, answers: [String]) {
    self.card = card
    self.answers = answers
  }
  
  /// Assesses whether the given answer is correct.
  ///  - parameters:
  ///     - answer: Potential answer to assess.
  ///  - returns: `True` if the answer given is correct. Otherwise `False`.
  public func isAnswerCorrect(_ answer: String) -> Bool {
    card.word.translation.caseInsensitiveCompare(answer) == .orderedSame
  }
}
