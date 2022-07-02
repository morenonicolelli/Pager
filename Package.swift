// swift-tools-version: 5.6
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Pager",
    platforms: [.iOS(.v14), .watchOS(.v8)],
    products: [
        .library(
            name: "Pager",
            targets: ["Pager"]),
    ],
    targets: [
        .target(
            name: "Pager",
            dependencies: []),
    ]
)
