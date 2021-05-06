import Quantities
import XCTest

class Distance_Tests: XCTestCase {
    
    func testConversion() {
        let distance1 = Distance(1.0, unit:.kilometers)
        XCTAssertEqual(distance1.value(in:.microns), 1000000000, accuracy:1.0)
        XCTAssertEqual(distance1.value(in:.millimeters), 1000000, accuracy:1.0)
        XCTAssertEqual(distance1.value(in:.centimeters), 100000, accuracy:1.0)
        XCTAssertEqual(distance1.value(in:.meters), 1000, accuracy:0.1)
        XCTAssertEqual(distance1.value(in:.kilometers), 1, accuracy:0.01)
        XCTAssertEqual(distance1.value(in:.mils), 39370078.74, accuracy:0.01)
        XCTAssertEqual(distance1.value(in:.inches), 39370.07874, accuracy:0.01)
        XCTAssertEqual(distance1.value(in:.feet), 3280.839895, accuracy:0.001)
        XCTAssertEqual(distance1.value(in:.yards), 1093.6132983, accuracy:0.001)
        XCTAssertEqual(distance1.value(in:.miles), 0.6213711922, accuracy:0.001)

        let distance2 = Distance(1.0, unit:.feet)
        XCTAssertEqual(distance2.value(in:.meters), 0.3048, accuracy:0.00001)
        XCTAssertEqual(distance2.value(in:.microns), 304800, accuracy:0.1)

        let distance3 = Distance(1.0, unit:.meters)
        XCTAssertEqual(distance3.value(in:.microns), 1000000, accuracy:1.0)
        XCTAssertEqual(distance3.value(in:.meters), 1.0, accuracy:0.1)
    }
    
    func testArithmetic() {
        let distance1 = Distance(1.0, unit:.centimeters) + Distance(25.0, unit:.microns)
        XCTAssertEqual(distance1.value(in:.microns), 10025, accuracy:0.01)
    }
    
    func testSuffixes() {
        XCTAssertEqual(10.microns.value(in:.microns), 10.0, accuracy:0.0001)
        XCTAssertEqual(10.millimeters.value(in:.millimeters), 10.0, accuracy:0.0001)
        XCTAssertEqual(10.centimeters.value(in:.centimeters), 10.0, accuracy:0.0001)
        XCTAssertEqual(10.meters.value(in:.meters), 10.0, accuracy:0.0001)
        XCTAssertEqual(10.miles.value(in:.miles), 10.0, accuracy:0.0001)
    }
}
