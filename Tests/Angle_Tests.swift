import XCTest

class Angle_Tests: XCTestCase {

    func testConversion() {
        let angle1 = Angle(180.0, unit:.degrees)
        XCTAssertEqual(angle1.value(in:.radians), .pi, accuracy:0.01)
        XCTAssertEqual(angle1.value(in:.degrees), 180.0, accuracy:0.01)

        let angle2 = Angle(.pi / 2.0, unit:.radians)
        XCTAssertEqual(angle2.value(in:.degrees), 90.0, accuracy:0.01)
    }
    
    func testArithmetic() {
        let angle1 = 180.degrees + Double.pi.radians
        XCTAssertEqual(angle1.value(in:.degrees), 360.0, accuracy:0.01)
    }
    
    func testTrigonometry() {
        XCTAssertEqual(sin(0.degrees), 0.0, accuracy:0.01)
        XCTAssertEqual(sin(90.degrees), 1.0, accuracy:0.01)
        XCTAssertEqual(cos(0.degrees), 1.0, accuracy:0.01)
        XCTAssertEqual(cos(90.degrees), 0.0, accuracy:0.01)
        XCTAssertEqual(tan(0.degrees), 0.0, accuracy:0.01)
        XCTAssertEqual(tan(45.degrees), 1.0, accuracy:0.01)
    }
    
    func testSuffixes() {
        XCTAssertEqual(10.degrees.value(in:.degrees), 10.0, accuracy:0.0001)
        XCTAssertEqual(10.radians.value(in:.radians), 10.0, accuracy:0.0001)
    }
}
