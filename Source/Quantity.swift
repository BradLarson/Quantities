//  This is based on Foundation's new Measurement and Unit types in 10.12 and iOS 10.
//  I'm going with the DimensionedNumber and DimensionalUnit identifiers to avoid a conflict between these implementations. I'm diverging a bit from their API and needed something I could use on older OS versions.

public struct Quantity<T:DimensionalUnit>: Comparable {
    public let unit:T
    private let value:Double
    
    public init(_ value:Double, unit:T) {
        self.value = value
        self.unit = unit
    }
    
    public func value(in unit:T) -> Double {
        guard (unit != self.unit) else {return value}
        return unit.convertFromBasis(self.unit.convertToBasis(value))
    }
    
    public func converting(to unit:T) -> Quantity<T> {
        guard (unit != self.unit) else {return self}
        return Quantity(self.value(in:unit), unit:unit)
    }
}

extension Quantity: CustomStringConvertible {
    public var description: String {
        return "\(self.value) \(self.unit)"
    }
}

public func +<T>(lhs:Quantity<T>, rhs:Quantity<T>) -> Quantity<T> {
    return Quantity(lhs.value + rhs.value(in:lhs.unit), unit:lhs.unit)
}

public func -<T>(lhs:Quantity<T>, rhs:Quantity<T>) -> Quantity<T> {
    return Quantity(lhs.value - rhs.value(in:lhs.unit), unit:lhs.unit)
}

public func *<T>(lhs:Double, rhs:Quantity<T>) -> Quantity<T> {
    return Quantity(lhs * rhs.value, unit:rhs.unit)
}

public func *<T>(lhs:Quantity<T>, rhs:Double) -> Quantity<T> {
    return Quantity(lhs.value * rhs, unit:lhs.unit)
}

public func /<T>(lhs:Quantity<T>, rhs:Double) -> Quantity<T> {
    return Quantity(lhs.value / rhs, unit:lhs.unit)
}

public func <<T>(lhs:Quantity<T>, rhs:Quantity<T>) -> Bool {
    return lhs.value < rhs.value(in:lhs.unit)
}
public func ==<T>(lhs:Quantity<T>, rhs:Quantity<T>) -> Bool {
    return lhs.value == rhs.value(in:lhs.unit)
}

public func abs<T>(_ value:Quantity<T>) -> Quantity<T> {
    return Quantity(abs(value.value(in:value.unit)), unit:value.unit)
}

public prefix func -<T>(_ value:Quantity<T>) -> Quantity<T> {
    return Quantity(-(value.value(in:value.unit)), unit:value.unit)
}
