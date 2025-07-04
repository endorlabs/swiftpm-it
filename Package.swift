// swift-tools-version: 6.1
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "SwiftPMIntegrationTest",
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "SwiftPMIntegrationTest",
            targets: ["SwiftPMIntegrationTest"]),
    ],
    dependencies: [
        .package(url: "https://github.com/apple/swift-argument-parser.git", exact: "1.2.2"),
        .package(url: "https://github.com/Alamofire/Alamofire.git", branch: "master"),
        .package(url: "https://github.com/apple/swift-nio.git", from: "2.0.0"),
        .package(url: "https://github.com/typealiased/mockingbird.git", from: "0.18.0"),
        .package(path: "Modules/LocalUtils"),
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "SwiftPMIntegrationTest",
            dependencies: [
                .product(name: "ArgumentParser", package: "swift-argument-parser"),
                .product(name: "Alamofire", package: "Alamofire"),
                .product(name: "NIO", package: "swift-nio"),
                "LocalUtils",
            ]),
        .testTarget(
            name: "SwiftPMIntegrationTestTests",
            dependencies: [
                "SwiftPMIntegrationTest",
                .product(name: "Mockingbird", package: "mockingbird"),
            ]
        ),
    ]
)
