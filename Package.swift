// swift-tools-version:5.5
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "SwiftDI",
    platforms: [
        .iOS(.v11)
    ],
    products: [
        .library(
            name: "SwiftDI",
            targets: ["SwiftDI"]),
    ],
    targets: [
        .target(
            name: "SwiftDI",
            dependencies: []),
        .testTarget(
            name: "SwiftDITests",
            dependencies: ["SwiftDI"]),
    ]
)
