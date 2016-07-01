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
    
    static let metersPerSecond = VelocityUnit(numerator:.meters, denominator:.seconds)
    static let milesPerHour = VelocityUnit(numerator:.miles, denominator:.hours)
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
    return Quantity(lhs.value(in:lhs.unit) / rhs.value(in:rhs.unit), unit:VelocityUnit(numerator:lhs.unit, denominator:rhs.unit))
}
