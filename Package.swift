// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.
import PackageDescription

let package = Package(
    name: "PKJSON",
    platforms: [
        .iOS(.v11), .macOS(.v10_13)
    ],
    products: [
        .library(name: "PKJSON", targets: ["PKJSON"]),
    ],
    dependencies: [
        .package(url: "https://github.com/ReactiveX/RxSwift.git", from: "6.0.0"),
    ],
    targets: [
        .target(name: "PKJSON", dependencies: [
            "RxSwift",
            .product(name: "RxRelay", package: "RxSwift"),
        ], path: "Sources"),
        
        .testTarget(name: "JSONTests",
                    dependencies: [
                        "PKJSON",
                        "RxSwift",
                        .product(name: "RxRelay", package: "RxSwift")
                    ])
    ],
    swiftLanguageVersions: [
        .v5
    ]
)
