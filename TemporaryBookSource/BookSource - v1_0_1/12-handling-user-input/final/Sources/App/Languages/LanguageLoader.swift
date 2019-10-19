import Foundation

import Languages

/// Handles loading of languages from any and all resources.
/// **Note**: Currently this only handles loading local JSON translated word files in JSON.
class LanguageLoader {
  
  /// This is the default singleton instance for language loader. The option is here to split the loaders
  /// for concurrent resource loading in the future.
  static private var `default`: LanguageLoader = LanguageLoader()
  
  /// Loads translated words into the `TranslatedWord` object. Depends on the `Languages` package.
  static func loadTranslatedWords(from fileName: String) -> [TranslatedWord]? {
    LanguageLoader.default.loadTranslatedWords(from: fileName)
  }
  
  /// Initializes a new instance of the `LanguageLoader`. This is privately scoped to restrict accidental
  /// duplication of `LanguageLoader` instances. Modify the scope if you wish to extend the language
  /// loading to concurrent or multi-source imports.
  private init() {}
  
  /// Loads an array of `TranslatedWord` objects from a JSON file into memory.
  ///
  /// If this is unsuccessful the error will be reported to the console but will not be thrown, potentially
  /// causing unpredictable behavior in any data flow which may depend on this data.
  ///
  ///  - parameters:
  ///     - fileName: Name of the (JSON) file to load in JSON.
  ///  - returns: An (optional) array of `TranslatedWord` objects.
  func loadTranslatedWords(from fileName: String) -> [TranslatedWord]? {
    if let url = Bundle.main.url(forResource: fileName, withExtension: "json") {
      do {
        let data = try Data(contentsOf: url)
        let decoder = JSONDecoder()
        let jsonData = try decoder.decode([TranslatedWord].self, from: data)
        return jsonData as [TranslatedWord]
      } catch {
        print("error:\(error)")
      }
    }
    return nil
  }
}
