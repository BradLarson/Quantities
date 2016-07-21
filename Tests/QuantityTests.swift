import XCTest

class QuantityTests: XCTestCase {
    
    func testConversion() {
        let distance1 = Distance(4.0, unit:.meters)
        XCTAssert(distance1.converting(to:.centimeters).description == "400.0 centimeters", "Actual description: \(distance1.converting(to:.centimeters).description)")
        XCTAssert(distance1.converting(to:.meters).description == "4.0 meters", "Actual description: \(distance1.converting(to:.meters).description)")
    }

    func testArithmetic() {
        let distance1 = Distance(4.0, unit:.meters) + Distance(1.0, unit:.centimeters)
        XCTAssertEqualWithAccuracy(distance1.value(in:.centimeters), 401, accuracy:0.001)

        let distance2 = Distance(4.0, unit:.meters) - Distance(1.0, unit:.centimeters)
        XCTAssertEqualWithAccuracy(distance2.value(in:.centimeters), 399, accuracy:0.001)

        let distance3 = Distance(0.0, unit:.meters) - Distance(1.0, unit:.centimeters)
        XCTAssertEqualWithAccuracy(distance3.value(in:.centimeters), -1, accuracy:0.001)
        
        let distance4 = Distance(4.0, unit:.meters) * 2.0
        XCTAssertEqualWithAccuracy(distance4.value(in:.centimeters), 800, accuracy:0.001)

        let distance5 = 2.0 * Distance(4.0, unit:.meters)
        XCTAssertEqualWithAccuracy(distance5.value(in:.centimeters), 800, accuracy:0.001)

        let distance6 = Distance(4.0, unit:.meters) / 2.0
        XCTAssertEqualWithAccuracy(distance6.value(in:.centimeters), 200, accuracy:0.001)

        let distance7 = Distance(4.0, unit:.meters) / Distance(2.0, unit:.meters)
        XCTAssertEqualWithAccuracy(distance7, 2.0, accuracy:0.001)

        let distance8 = -Distance(4.0, unit:.meters)
        XCTAssertEqualWithAccuracy(distance8.value(in:.centimeters), -400, accuracy:0.001)

        let distance9 = abs(-Distance(4.0, unit:.meters))
        XCTAssertEqualWithAccuracy(distance9.value(in:.centimeters), 400, accuracy:0.001)
        
        XCTAssert(Distance(4.0, unit:.meters) == Distance(4.0, unit:.meters))
        XCTAssert(Distance(2.0, unit:.meters) < Distance(4.0, unit:.meters))
        XCTAssert(!(Distance(4.0, unit:.meters) < Distance(2.0, unit:.meters)))
    }
}
