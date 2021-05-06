// swift-tools-version:4.0
import PackageDescription

let package = Package(
    name: "Quantities",
    products: [
        .library(name: "Quantities", targets: ["Quantities"]),
    ],
    targets: [
        .target(name: "Quantities", path: "Source"),
        .testTarget(name: "QuantitiesTests", dependencies: ["Quantities"], path: "Tests"),
    ]
)
