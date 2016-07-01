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
