public typealias Area = Quantity<AreaUnit>

public enum AreaUnit: DimensionalUnitSimpleScaled {
    case km2
    case m2
    case cm2
    case sqft
    case sqmile
    case acres
    
    public var multiplierToBasis:Double {
        get {
            switch self {
                case .km2: return 1000.0 * 1000.0
                case .m2: return 1.0
                case .cm2: return 1.0 / (100.0 * 100.0)
                case .sqft: return 0.3048 * 0.3048
                case .sqmile: return 1609.344 * 1609.344
                case .acres: return 43560.17424052 * 0.3048 * 0.3048
            }
        }
    }
}

public func *(lhs:Distance, rhs:Distance) -> Area {
    return Area(lhs.value(in:.kilometers) * rhs.value(in:.kilometers), unit:.km2)
}

public func /(lhs:Area, rhs:Distance) -> Distance {
    return Distance(lhs.value(in:.km2) / rhs.value(in:.kilometers), unit:.kilometers)
}
