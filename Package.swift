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
    ],
    targets: [
        .target(name: "WWLog", resources: [.process("Material"), .process("Storyboard"), .copy("Privacy")]),
    ],
    swiftLanguageVersions: [
        .v5
    ]
)
