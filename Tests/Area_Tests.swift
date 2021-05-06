import Quantities
import XCTest

class Area_Tests: XCTestCase {
    
    func testConversion() {
        let area1 = Area(100.0, unit:.km2)
        XCTAssertEqual(area1.value(in:.sqft), 1076391041.671, accuracy:0.01)
        XCTAssertEqual(area1.value(in:.acres), 24710.4393, accuracy:0.01)
        
        let area2 = Area(1.0, unit:.acres)
        XCTAssertEqual(area2.value(in:.sqft), 43560.17424052, accuracy:0.01)
    }
    
    func testArithmetic() {
        let area1 = Area(1.0, unit:.km2) + Area(1000.0, unit:.m2)
        XCTAssertEqual(area1.value(in:.km2), 1.001, accuracy:0.001)
        XCTAssertEqual(area1.value(in:.m2), 1001000.0, accuracy:0.001)

        let area2 = Area(100.0, unit:.km2) + Area(100.0, unit:.km2)
        XCTAssertEqual(area2.value(in:.acres), (24710.4393 * 2.0), accuracy:0.01)
    }
}
