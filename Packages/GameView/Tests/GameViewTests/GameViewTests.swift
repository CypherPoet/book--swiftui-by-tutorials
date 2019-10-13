import XCTest
@testable import GameView

final class GameViewTests: XCTestCase {
    
    func testInit() {
        XCTAssertNotNil(GameViewTests())
    }

    static var allTests = [
        ("testInit", testInit),
    ]
}
