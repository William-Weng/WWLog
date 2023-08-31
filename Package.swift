// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "WWLog",
    platforms: [
        .iOS(.v14)
    ],
    products: [
        .library(name: "WWLog", targets: ["WWLog"]),
    ],
    dependencies: [
        .package(name: "WWPrint", url: "https://github.com/William-Weng/WWPrint.git", from: "1.0.0"),
    ],
    targets: [
        .target(name: "WWLog", dependencies: ["WWPrint"], resources: [.process("Material"), .process("Storyboard")]),
        .testTarget(name: "WWLogTests", dependencies: ["WWLog"]),
    ],
    swiftLanguageVersions: [
        .v5
    ]
)
