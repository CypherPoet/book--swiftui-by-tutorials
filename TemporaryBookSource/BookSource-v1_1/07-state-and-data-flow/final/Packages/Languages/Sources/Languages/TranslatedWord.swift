/// A `Codable` representation of a translated word with the original word (`original`), the `pronunciation`, and the `translation`.
/// The model does not prescribe to a specific language and can be tailored to suit any human language as a source or (translation) target.
public struct TranslatedWord {
    
    /// Represents the origin word (before translation) in the native character set.
    /// (i.e. Kanji, Katakana, or Hiragana for Japanese)
    public let original: String
    
    /// Represents the pronciation in the target language for the learner to
    /// practice aural pronunciation.
    public let pronunciation: String
    
    /// The translated word as represented in the target (learner's) language
    /// and character set.
    public let translation: String
    
    /// Initializes a new `TranslatedWord` with the word at origin, the pronunciation, and the translation.
    ///
    ///  - parameters:
    ///     - original: Word as understood at from the origin language.
    ///     - pronunciation: Pronunciation of the word as represented with the target language.
    ///     - translation: Translation of the word as represented at the target language.
    public init(from original: String, withPronunciation pronunciation: String, andTranslation translation: String) {
        self.original = original
        self.pronunciation = pronunciation
        self.translation = translation
    }
}

extension TranslatedWord: Codable {
    
}
