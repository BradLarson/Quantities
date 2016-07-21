import XCTest

class Time_Tests: XCTestCase {
    
    func testConversion() {
        let time1 = Time(1.0, unit:.minutes)
        XCTAssertEqualWithAccuracy(time1.value(in:.nanoseconds), 60000000000, accuracy:0.1)
        XCTAssertEqualWithAccuracy(time1.value(in:.microseconds), 60000000, accuracy:0.1)
        XCTAssertEqualWithAccuracy(time1.value(in:.milliseconds), 60000, accuracy:0.1)
        XCTAssertEqualWithAccuracy(time1.value(in:.seconds), 60, accuracy:0.1)
        XCTAssertEqualWithAccuracy(time1.value(in:.minutes), 1, accuracy:0.1)
        XCTAssertEqualWithAccuracy(time1.value(in:.hours), 0.01666666666667, accuracy:0.00001)
        
        let time2 = Time(1.0, unit:.seconds)
        XCTAssertEqualWithAccuracy(time2.value(in:.seconds), 1, accuracy:0.1)
        XCTAssertEqualWithAccuracy(time2.value(in:.minutes), 0.01666666666667, accuracy:0.1)
    }
    
    func testArithmetic() {
        let time1 = Time(1.0, unit:.hours) + Time(1.0, unit:.seconds)
        XCTAssertEqualWithAccuracy(time1.value(in:.seconds), 3601, accuracy:0.1)
    }
    
    func testSuffixes() {
        XCTAssertEqualWithAccuracy(10.milliseconds.value(in:.milliseconds), 10.0, accuracy:0.0001)
        XCTAssertEqualWithAccuracy(10.seconds.value(in:.seconds), 10.0, accuracy:0.0001)
        XCTAssertEqualWithAccuracy(10.minutes.value(in:.minutes), 10.0, accuracy:0.0001)
        XCTAssertEqualWithAccuracy(10.hours.value(in:.hours), 10.0, accuracy:0.0001)
    }
}
