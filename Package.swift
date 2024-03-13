// swift-tools-version:5.6
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
        .package(url: "https://github.com/William-Weng/WWPrint.git", from: "1.3.0"),
    ],
    targets: [
        .target(name: "WWLog", dependencies: ["WWPrint"], resources: [.process("Material"), .process("Storyboard"), .copy("Privacy")]),
        .testTarget(name: "WWLogTests", dependencies: ["WWLog"]),
    ],
    swiftLanguageVersions: [
        .v5
    ]
)
