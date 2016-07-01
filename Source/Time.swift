public typealias Time = Quantity<TimeUnit>

public enum TimeUnit: DimensionalUnitSimpleScaled {
    case seconds
    case minutes
    case hours
    
    public var multiplierToBasis:Double {
        get {
            switch self {
                case seconds: return 1.0
                case minutes: return 60.0
                case hours: return 3600.0
            }
        }
    }
    
    var singularDescription:String {
        get {
            switch self {
                case seconds: return "second"
                case minutes: return "minute"
                case hours: return "hour"
            }
        }
    }
}
