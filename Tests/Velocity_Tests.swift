import Quantities
import XCTest

class Velocity_Tests: XCTestCase {
    
    func testConversion() {
        let velocity1 = Velocity(1.0, unit:.milesPerHour)
        XCTAssertEqual(velocity1.value(in:.metersPerSecond), 0.44704, accuracy:0.0001)
        XCTAssertEqual(velocity1.value(in:.milesPerHour), 1.0, accuracy:0.001)
        XCTAssertEqual(velocity1.value(in:.kilometersPerHour), 1.609344, accuracy:0.00001)

        let velocity2 = Velocity(1.0, unit:VelocityUnit(numerator:.meters, denominator:.seconds))
        XCTAssertEqual(velocity2.value(in:.metersPerSecond), 1.0, accuracy:0.0001)
        
        XCTAssert(VelocityUnit(numerator:.miles, denominator:.hours) == VelocityUnit.milesPerHour)
    }
    
    func testArithmetic() {
        let velocity1 = Distance(1.0, unit:.meters) / Time(0.5, unit:.seconds)
        XCTAssertEqual(velocity1.value(in:.metersPerSecond), 2.0, accuracy:0.0001)

        let distance1 = Velocity(1.0, unit:.metersPerSecond) * Time(3.5, unit:.seconds)
        XCTAssertEqual(distance1.value(in:.meters), 3.5, accuracy:0.0001)
    }

    func testDescription() {
        XCTAssert(VelocityUnit(numerator:.miles, denominator:.hours).description == "miles / hour")
        XCTAssert(VelocityUnit(numerator:.meters, denominator:.nanoseconds).description == "meters / nanosecond")
        XCTAssert(VelocityUnit(numerator:.feet, denominator:.microseconds).description == "feet / microsecond")
        XCTAssert(VelocityUnit(numerator:.miles, denominator:.milliseconds).description == "miles / millisecond")
        XCTAssert(VelocityUnit(numerator:.inches, denominator:.seconds).description == "inches / second")
        XCTAssert(VelocityUnit(numerator:.miles, denominator:.minutes).description == "miles / minute")
    }
}
