import XCTest
@testable import Game

final class GameTests: XCTestCase {
    
    func testInit() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        XCTAssertNotNil(BullsEyeGame())
    }

    static var allTests = [
        ("testInit", testInit),
    ]
}
