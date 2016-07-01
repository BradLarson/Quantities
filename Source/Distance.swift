public typealias Distance = Quantity<DistanceUnit>

public enum DistanceUnit: DimensionalUnitSimpleScaled {
    case microns
    case millimeters
    case centimeters
    case meters
    case miles
    
    public var multiplierToBasis:Double {
        get {
            switch self {
                case microns: return 1.0 / 1000000.0
                case millimeters: return 1.0 / 1000.0
                case centimeters: return 1.0 / 100.0
                case meters: return 1.0
                case miles: return 1609.34
            }
        }
    }
}
