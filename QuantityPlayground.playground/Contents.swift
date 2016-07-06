import Quantities

let angle1 = 180.degrees + Double.pi.radians

let distance = 1.millimeters + 200.microns - 100.microns

200.microns > 2.millimeters
1100.microns > 1.millimeters

let velocity = 300.meters / 2.seconds
velocity.converting(to:.milesPerHour)
let distanceTraveled = velocity * 10.minutes

let ratio = 2.seconds / 4.milliseconds
