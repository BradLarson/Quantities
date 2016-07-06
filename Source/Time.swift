public typealias Time = Quantity<TimeUnit>

public enum TimeUnit: DimensionalUnitSimpleScaled {
    case nanoseconds
    case microseconds
    case milliseconds
    case seconds
    case minutes
    case hours
    
    public var multiplierToBasis:Double {
        get {
            switch self {
                case nanoseconds: return  0.000000001
                case microseconds: return 0.000001
                case milliseconds: return 0.001
                case seconds: return 1.0
                case minutes: return 60.0
                case hours: return 3600.0
            }
        }
    }
    
    var singularDescription:String {
        get {
            switch self {
                case nanoseconds: return "nanosecond"
                case microseconds: return "microsecond"
                case milliseconds: return "millisecond"
                case seconds: return "second"
                case minutes: return "minute"
                case hours: return "hour"
            }
        }
    }
}

