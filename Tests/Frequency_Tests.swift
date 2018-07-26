import XCTest

class Frequency_Tests: XCTestCase {
    
    func testConversion() {
        let frequency1 = Frequency(1.0, unit:.kilohertz)
        XCTAssertEqual(frequency1.value(in:.hertz), 1000, accuracy:0.1)
        XCTAssertEqual(frequency1.value(in:.kilohertz), 1, accuracy:0.1)
        XCTAssertEqual(frequency1.value(in:.megahertz), 0.001, accuracy:0.00001)
        
        let frequency2 = Frequency(1.0, unit:.hertz)
        XCTAssertEqual(frequency2.value(in:.kilohertz), 0.001, accuracy:0.00001)
    }
    
    func testArithmetic() {
        let frequency1 = Frequency(1.0, unit:.kilohertz) + Frequency(1.0, unit:.hertz)
        XCTAssertEqual(frequency1.value(in:.hertz), 1001, accuracy:0.01)
    }
    
    func testSuffixes() {
        XCTAssertEqual(10.hertz.value(in:.hertz), 10.0, accuracy:0.0001)
        XCTAssertEqual(10.kilohertz.value(in:.kilohertz), 10.0, accuracy:0.0001)
        XCTAssertEqual(10.megahertz.value(in:.megahertz), 10.0, accuracy:0.0001)
    }
}
