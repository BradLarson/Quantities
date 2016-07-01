import Foundation

public typealias Angle = Quantity<AngleUnit>

public enum AngleUnit: DimensionalUnitSimpleScaled {
    case degrees
    case radians
    
    public var multiplierToBasis:Double {
        get {
            switch self {
                case degrees: return .pi / 180.0
                case radians: return 1.0
            }
        }
    }
}

public func sin(_ angle:Angle) -> Double {
    return sin(angle.value(in:.radians))
}

public func cos(_ angle:Angle) -> Double {
    return cos(angle.value(in:.radians))
}

public func tan(_ angle:Angle) -> Double {
    return tan(angle.value(in:.radians))
}
