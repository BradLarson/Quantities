public typealias Distance = Quantity<DistanceUnit>

public enum DistanceUnit: DimensionalUnitSimpleScaled {
    case microns
    case millimeters
    case centimeters
    case meters
    case kilometers
    case mils
    case inches
    case feet
    case yards
    case miles
    
    public var multiplierToBasis:Double {
        get {
            switch self {
                case .microns: return 1.0 / 1000000.0
                case .millimeters: return 1.0 / 1000.0
                case .centimeters: return 1.0 / 100.0
                case .meters: return 1.0
                case .kilometers: return 1000.0
                case .mils: return 0.0000254
                case .inches: return 0.0254
                case .feet: return 0.3048
                case .yards: return 0.9144
                case .miles: return 1609.344
            }
        }
    }
}
