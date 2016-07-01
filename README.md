# Quantities #

Brad Larson

http://www.sunsetlakesoftware.com

[@bradlarson](http://twitter.com/bradlarson)

contact@sunsetlakesoftware.com

## Overview ##

This is a Swift module for working with physical quantities with units, like velocities, angles, masses, etc. It is heavily inspired by the new <a href="https://developer.apple.com/reference/foundation/nsmeasurement">Measurement and Unit</a> types in Foundation.

I wanted to see if I could build a purely Swift version of these that I could use for deployment to older OS versions (Measurement in Foundation currently requires macOS 10.12 and iOS 10) and to experiment with extensions to the support provided using Swift's type system. In particular, I wanted to see if I could make it even easier to create and work with these numbers, as well as experiment with composite unit types and complex calculations.

I've changed the names to Quantity for the base numerical type and DimensionalUnit for the unit types to avoid conflicts with Foundation. The number of units I support is a little limited now, only because I haven't taken the time to enter them all in with conversion factors.

## License ##

MIT, with the full license available with the framework in License.txt.

## Technical requirements ##

- Swift 3
- Xcode 8 on Mac or iOS
- iOS: 8.0 or higher (Swift is supported on 7.0, but not Mac-style frameworks)
- OSX: 10.9 or higher
- Linux: Should be usable where Swift 3 runs, with the Swift Package Manager

## Using Quantities in an Mac or iOS application ##

To add the Quantities module to a Mac or iOS application, either drag the Quantities-Mac.xcodeproj or Quantities-iOS.xcodeproj project into your application's project or add it via File | Add Files To...

After that, go to your project's Build Phases and add Quantities as a Target Dependency. Add it to the Link Binary With Libraries phase. Add a new Copy Files build phase, set its destination to Frameworks, and add Quantities.framework to that. That last step will make sure the framework is deployed in your application bundle. 

In any of your Swift files that reference Quantity types, simply add

```swift
import Quantities
```

and you should be ready to go.

Note that you may need to build your project once to parse and build the Quantities framework in order for Xcode to stop warning you about the framework and its types being missing.

## Unit declaration ##

The fundamental type in the module is `Quantity<T>`, where T is a DimensionalUnit type. Quantity stores both a numerical value and the corresponding dimensional unit for that value. Dimensional units belong to specific classifications, so a Quantity using a LengthUnit can't be interchanged with one using a TimeUnit.

To declare a Quantity, you use syntax similar to the following:

```swift
let angle1 = Quantity(180.0, unit:AngleUnit.degrees)
```

To make this a little simpler, each of the Quantity types that correspond to a particular DimensionalUnit are given typealiases like Angle, Distance, Frequency, etc.:

```swift
let angle1 = Angle(180.0, unit:.degrees)
```

This makes it easy to restrict function types to specific quantity types:

```swift
func calculateTravelTime(distance:Distance, velocity:Velocity) -> Time
```

To further simplify creation of dimensioned quantities, suffixes are provided as an extension to Double:

```swift
let angle1 = 180.degrees
```

## Unit conversion ##

One goal with these dimensioned units is to make it difficult to mess up unit conversions or make bad assumptions about the units being passed around in your code. You have to explicitly specify a unit when initializing a Quantity with a numerical value, and to extract a numerical value from one you also need to provide a unit:

```swift
let output = angle1.value(in:.degrees)
```

Quantities can be converted internally between units:

```swift
let radianAngle = angle1.converting(to:.radians)
```

Internally, quantities are automatically converted to and from appropriate units when added, subtracted, etc.:

```swift
let angle1 = 180.degrees + Double.pi.radians
```


### Currently supported unit types ###

- **Angle**
  - *degrees*
  - *radians*

- **Distance**
  - *microns*
  - *millimeters*
  - *centimeters*
  - *meters*
  - *miles*

- **Frequency**
  - *hertz*
  - *kilohertz*
  - *megahertz*

- **Time**
  - *seconds*
  - *minutes*
  - *hours*

- **Velocity**: This is a composite type made of any distance divided by any velocity, but it has some stock cases.
  - *metersPerSecond*
  - *milesPerHour*

