// swift-tools-version: 5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "AuthenticatedRequests",
    platforms: [.iOS(.v13), .macOS(.v10_15)],
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(
            name: "AuthenticatedRequests",
            targets: ["AuthenticatedRequests"]),
        .library(
            name: "CodeFlowOAuth",
            targets: ["CodeFlowOAuth"])
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        // .package(url: /* package url */, from: "1.0.0"),
        .package(url: "https://github.com/evgenyneu/keychain-swift.git", from: "20.0.0")
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        .target(
            name: "AuthenticatedRequests",
            dependencies: [.product(name: "KeychainSwift", package: "keychain-swift")]),
        .target(
            name: "CodeFlowOAuth",
            dependencies: [.product(name: "KeychainSwift", package: "keychain-swift"),
                           "AuthenticatedRequests"]),
        .testTarget(
            name: "AuthenticatedRequestsTests",
            dependencies: ["AuthenticatedRequests", .product(name: "KeychainSwift", package: "keychain-swift")])
    ]
)
