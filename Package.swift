// swift-tools-version: 6.2
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "SwiftLA",
    platforms: [
        .macOS(.v10_13),
        .iOS(.v16),
        .watchOS(.v9),
        .tvOS(.v16),
    ],
    products: [
        .library(name: "Vector", targets: ["Vector"]),
        .library(name: "Matrix", targets: ["Matrix"]),
        .library(name: "SwiftLA", targets: ["SwiftLA"]),
    ],
    dependencies: [],
    targets: [
        .target(
            name: "Vector",
            dependencies: [],
            path: "Sources/Vector",
            swiftSettings: [
                .enableUpcomingFeature("StrictConcurrency")
            ]
        ),
        .target(
            name: "Matrix",
            dependencies: [],
            path: "Sources/Matrix",
            swiftSettings: [
                .enableUpcomingFeature("StrictConcurrency")
            ]
        ),
        .target(
            name: "SwiftLA",
            dependencies: ["Vector", "Matrix"],
            path: "Sources/SwiftLA",
            swiftSettings: [
                .enableUpcomingFeature("StrictConcurrency")
            ]
        ),
        .testTarget(
            name: "SwiftLATests",
            dependencies: ["SwiftLA"],
            path: "Tests/SwiftLATests"
        ),
    ]
)
