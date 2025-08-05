// swift-tools-version: 6.1
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "LocalUtils",
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "LocalUtils",
            targets: ["LocalUtils"]),
    ],
    dependencies: [
        .package(url: "https://github.com/airbnb/lottie-ios.git", exact: "4.5.2")
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "LocalUtils",
            dependencies: [
                .product(name: "Lottie", package: "lottie-ios")
            ]
        ),
        .testTarget(
            name: "LocalUtilsTests",
            dependencies: ["LocalUtils"]
        ),
    ]
)
