public typealias Velocity = Quantity<VelocityUnit>

public struct VelocityUnit: DimensionalUnitSimpleScaled {
    let numerator:DistanceUnit
    let denominator:TimeUnit
    
    public init(numerator:DistanceUnit, denominator:TimeUnit) {
        self.numerator = numerator
        self.denominator = denominator
    }
    
    public var multiplierToBasis:Double {
        get {
            return numerator.multiplierToBasis / denominator.multiplierToBasis
        }
    }
    
    public static let metersPerSecond = VelocityUnit(numerator:.meters, denominator:.seconds)
    public static let milesPerHour = VelocityUnit(numerator:.miles, denominator:.hours)
    public static let kilometersPerHour = VelocityUnit(numerator:.kilometers, denominator:.hours)
}

extension VelocityUnit: CustomStringConvertible {
    public var description: String {
        return "\(numerator) / \(denominator.singularDescription)"
    }
}

public func == (lhs:VelocityUnit, rhs:VelocityUnit) -> Bool {
    return (lhs.numerator == rhs.numerator) && (lhs.denominator == rhs.denominator)
}

public func /(lhs:Distance, rhs:Time) -> Velocity {
    return Velocity(lhs.value(in:lhs.unit) / rhs.value(in:rhs.unit), unit:VelocityUnit(numerator:lhs.unit, denominator:rhs.unit))
}

public func *(lhs:Velocity, rhs:Time) -> Distance {
    return Distance(rhs.value(in:lhs.unit.denominator) * lhs.value(in:lhs.unit), unit:lhs.unit.numerator)
}

