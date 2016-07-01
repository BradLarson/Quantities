import XCTest

class Angle_Tests: XCTestCase {

    func testConversion() {
        let angle1 = Angle(180.0, unit:.degrees)
        XCTAssertEqualWithAccuracy(angle1.value(in:.radians), .pi, accuracy:0.01)
        XCTAssertEqualWithAccuracy(angle1.value(in:.degrees), 180.0, accuracy:0.01)
    }
    
    func testArithmetic() {
        let angle1 = 180.degrees + Double.pi.radians
        XCTAssertEqualWithAccuracy(angle1.value(in:.degrees), 360.0, accuracy:0.01)
    }
}
