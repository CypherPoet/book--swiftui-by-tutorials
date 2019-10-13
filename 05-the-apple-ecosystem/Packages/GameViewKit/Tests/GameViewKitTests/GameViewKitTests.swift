import XCTest
@testable import GameViewKit


final class GameViewKitTests: XCTestCase {
    
    func testInit() {
        XCTAssertNotNil(GameViewKitTests())
    }

    static var allTests = [
        ("testInit", testInit),
    ]
}
