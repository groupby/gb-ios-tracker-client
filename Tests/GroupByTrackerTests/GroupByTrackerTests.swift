import XCTest
@testable import GroupByTracker

final class GroupByTrackerTests: XCTestCase {
    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        XCTAssertEqual(GbTracker(customerId: "test", area: "test", login: Login(loggedIn: false,username: "")).customerId, "test")
    }
}
