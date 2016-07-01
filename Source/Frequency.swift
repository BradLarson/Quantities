public typealias Frequency = Quantity<FrequencyUnit>

public enum FrequencyUnit: DimensionalUnitSimpleScaled {
    case hertz
    case kilohertz
    case megahertz
    
    public var multiplierToBasis:Double {
        get {
            switch self {
                case hertz: return 1.0
                case kilohertz: return 1000.0
                case megahertz: return 1000000.0
            }
        }
    }
}
