import Foundation

extension Double {
    // Distance
    public var microns:Distance { get { return Distance(self, unit:.microns) } }
    public var millimeters:Distance { get { return Distance(self, unit:.millimeters) } }
    public var centimeters:Distance { get { return Distance(self, unit:.centimeters) } }
    public var meters:Distance { get { return Distance(self, unit:.meters) } }
    public var miles:Distance { get { return Distance(self, unit:.miles) } }
    public var inches:Distance { get { return Distance(self, unit:.inches) } }

    // Time
    public var milliseconds:Time { get { return Time(self, unit:.milliseconds) } }
    public var seconds:Time { get { return Time(self, unit:.seconds) } }
    public var minutes:Time { get { return Time(self, unit:.minutes) } }
    public var hours:Time { get { return Time(self, unit:.hours) } }

    // Angle
    public var degrees:Angle { get { return Angle(self, unit:.degrees) } }
    public var radians:Angle { get { return Angle(self, unit:.radians) } }
    
    // Frequency
    public var hertz:Frequency { get { return Frequency(self, unit:.hertz) } }
    public var kilohertz:Frequency { get { return Frequency(self, unit:.kilohertz) } }
    public var megahertz:Frequency { get { return Frequency(self, unit:.megahertz) } }
}

#if !os(Linux)
public extension Thread {
    class func sleep(forTimeInterval ti:Time) {
        Thread.sleep(forTimeInterval:ti.value(in:.seconds))
    }
}
    
#endif
