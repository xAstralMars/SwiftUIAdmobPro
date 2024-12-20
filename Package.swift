// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "SwiftUIAdmobPro",
    platforms: [
        .iOS(.v14)
    ],
    products: [
        .library(
            name: "SwiftUIAdmobPro",
            targets: ["SwiftUIAdmobPro"]),
    ],
    dependencies: [
        .package(
            url: "https://github.com/googleads/swift-package-manager-google-mobile-ads.git",
            from: "11.13.0"
        )
    ],
    targets: [
        .target(
            name: "SwiftUIAdmobPro",
            dependencies: [
                .product(name: "GoogleMobileAds", package: "swift-package-manager-google-mobile-ads")
            ],
            path: "Sources"
        )
    ]
)
