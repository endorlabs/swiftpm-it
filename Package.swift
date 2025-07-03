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
        .package(url: "https://github.com/apple/swift-docc.git", revision: "b14b0d9fff23ef62795792085b1a21ae17eff9de"),
        .package(url: "https://github.com/Alamofire/Alamofire.git", branch: "master"),
        .package(url: "https://github.com/firebase/firebase-ios-sdk.git", from: "10.4.0"),
        .package(url: "https://github.com/Quick/Nimble.git", from: "13.0.0"),
        .package(path: "Modules/LocalUtils"),
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "SwiftPMIntegrationTest",
            dependencies: [
                .product(name: "ArgumentParser", package: "swift-argument-parser"),
                .product(name: "SwiftDocC", package: "swift-docc"),
                .product(name: "Alamofire", package: "Alamofire"),
                .product(name: "FirebaseAuth", package: "firebase-ios-sdk"),
                "LocalUtils",
            ]),
        .testTarget(
            name: "SwiftPMIntegrationTestTests",
            dependencies: [
                "SwiftPMIntegrationTest",
                .product(name: "Nimble", package: "Nimble"),
            ]
        ),
    ]
)
