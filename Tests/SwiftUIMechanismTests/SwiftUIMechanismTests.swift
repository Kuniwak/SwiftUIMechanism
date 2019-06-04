import XCTest
import SwiftUIMechanism


final class SwiftUIMechanismTests: XCTestCase {
    func testExample() {
        ViewA {
            ViewB()
        }

        XCTAssertEqual(Context.current, .rootView(RootView(subviews: [
            .viewA(ViewA(subviews: [
                .viewB(ViewB(subviews: [])),
            ]))
        ])))
    }

    static var allTests = [
        ("testExample", testExample),
    ]
}
