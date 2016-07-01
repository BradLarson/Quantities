public protocol DimensionalUnit: Equatable {
    func convertToBasis(_ value:Double) -> Double
    func convertFromBasis(_ value:Double) -> Double
}

public protocol DimensionalUnitSimpleScaled: DimensionalUnit {
    var multiplierToBasis:Double { get }
}

public extension DimensionalUnitSimpleScaled {
    func convertToBasis(_ value:Double) -> Double {
        return value * self.multiplierToBasis
    }
    
    func convertFromBasis(_ value:Double) -> Double {
        return value / self.multiplierToBasis
    }
}
