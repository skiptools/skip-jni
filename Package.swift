// swift-tools-version: 6.1
import PackageDescription

// JNI bridge code manages its own thread/isolation invariants and cannot be expressed
// under Swift 6 strict concurrency without a deep refactor. Compile every target in
// Swift 5 language mode so strict-concurrency diagnostics revert to opt-in.
let opt_out_of_strict_concurrency: [SwiftSetting] = [.swiftLanguageMode(.v5)]

let package = Package(
    name: "skip-bridge",
    platforms: [.iOS(.v16), .macOS(.v13)],
    products: [
        .library(name: "SkipBridge", type: .dynamic, targets: ["SkipBridge"]),
        .library(name: "SkipBridgeToKotlinSamples", type: .dynamic, targets: ["SkipBridgeToKotlinSamples"]),
        .library(name: "SkipBridgeToKotlinSamplesHelpers", type: .dynamic, targets: ["SkipBridgeToKotlinSamplesHelpers"]),
        .library(name: "SkipBridgeToKotlinCompatSamples", type: .dynamic, targets: ["SkipBridgeToKotlinCompatSamples"]),
        .library(name: "SkipBridgeToSwiftSamples", type: .dynamic, targets: ["SkipBridgeToSwiftSamples"]),
        .library(name: "SkipBridgeToSwiftSamplesHelpers", type: .dynamic, targets: ["SkipBridgeToSwiftSamplesHelpers"]),
        .library(name: "SkipBridgeToSwiftSamplesTestsSupport", type: .dynamic, targets: ["SkipBridgeToSwiftSamplesTestsSupport"]),
    ],
    dependencies: [
        .package(url: "https://source.skip.tools/skip.git", from: "1.8.17"),
        .package(url: "https://source.skip.tools/skip-lib.git", from: "1.4.0"),
        .package(url: "https://source.skip.tools/skip-foundation.git", from: "1.4.0"),
        .package(url: "https://source.skip.tools/swift-jni.git", branch: "jni-updates"), // FIXME
        //.package(url: "https://source.skip.tools/swift-jni.git", "0.5.0"..<"2.0.0"),
    ],
    targets: [
        .target(name: "SkipBridge",
            dependencies: [.product(name: "SwiftJNI", package: "swift-jni"), .product(name: "SkipLib", package: "skip-lib")],
            swiftSettings: opt_out_of_strict_concurrency,
            plugins: [.plugin(name: "skipstone", package: "skip")]),
        .target(name: "SkipBridgeToKotlinSamples",
            dependencies: ["SkipBridgeToKotlinSamplesHelpers"],
            swiftSettings: opt_out_of_strict_concurrency,
            plugins: [.plugin(name: "skipstone", package: "skip")]),
        .target(name: "SkipBridgeToKotlinSamplesHelpers",
            dependencies: ["SkipBridge", .product(name: "SkipFoundation", package: "skip-foundation")],
            swiftSettings: opt_out_of_strict_concurrency,
            plugins: [.plugin(name: "skipstone", package: "skip")]),
        .target(name: "SkipBridgeToKotlinCompatSamples",
            dependencies: ["SkipBridge", .product(name: "SkipFoundation", package: "skip-foundation")],
            swiftSettings: opt_out_of_strict_concurrency,
            plugins: [.plugin(name: "skipstone", package: "skip")]),
        .target(name: "SkipBridgeToSwiftSamples",
            dependencies: ["SkipBridgeToSwiftSamplesHelpers"],
            swiftSettings: opt_out_of_strict_concurrency,
            plugins: [.plugin(name: "skipstone", package: "skip")]),
        .target(name: "SkipBridgeToSwiftSamplesHelpers",
            dependencies: ["SkipBridge", .product(name: "SkipFoundation", package: "skip-foundation")],
            swiftSettings: opt_out_of_strict_concurrency,
            plugins: [.plugin(name: "skipstone", package: "skip")]),
        .target(name: "SkipBridgeToSwiftSamplesTestsSupport",
            dependencies: ["SkipBridgeToSwiftSamples"],
            swiftSettings: opt_out_of_strict_concurrency,
            plugins: [.plugin(name: "skipstone", package: "skip")]),
        .testTarget(name: "SkipBridgeToKotlinSamplesTests",
            dependencies: ["SkipBridgeToKotlinSamples", .product(name: "SkipTest", package: "skip")],
            swiftSettings: opt_out_of_strict_concurrency,
            plugins: [.plugin(name: "skipstone", package: "skip")]),
        .testTarget(name: "SkipBridgeToKotlinCompatSamplesTests",
            dependencies: ["SkipBridgeToKotlinCompatSamples", .product(name: "SkipTest", package: "skip")],
            swiftSettings: opt_out_of_strict_concurrency,
            plugins: [.plugin(name: "skipstone", package: "skip")]),
        .testTarget(name: "SkipBridgeToSwiftSamplesTestsSupportTests",
            dependencies: ["SkipBridgeToSwiftSamplesTestsSupport", .product(name: "SkipTest", package: "skip")],
            swiftSettings: opt_out_of_strict_concurrency,
            plugins: [.plugin(name: "skipstone", package: "skip")]),
    ]
)
