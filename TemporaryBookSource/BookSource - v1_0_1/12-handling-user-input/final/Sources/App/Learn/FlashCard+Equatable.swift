extension FlashCard: Equatable {
  static func == (lhs: FlashCard, rhs: FlashCard) -> Bool {
    return lhs.card.word.original == rhs.card.word.original &&
      lhs.card.word.translation == rhs.card.word.translation
  }
}
