// swift-tools-version: 5.9
import PackageDescription

// Mirror swift-jni's SWIFT_JAVA_JNI_CORE option: when the JNI layer is backed by
// swiftlang/swift-java-jni-core, JObject gains a `required init(fromJNI:in:)` from its JavaValue
// conformance, so the JObject subclass JavaBackedClosure must provide that initializer under the
// same flag. The flag is read from the environment at manifest-evaluation time, matching swift-jni.
let swiftJavaJNICore = (Context.environment["SWIFT_JAVA_JNI_CORE"] ?? "1") == "1"
let jniCoreSwiftSettings: [SwiftSetting] = swiftJavaJNICore ? [.define("SWIFT_JAVA_JNI_CORE")] : []

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
        //.package(url: "https://source.skip.tools/swift-jni.git", "0.5.0"..<"2.0.0"),
        .package(url: "https://source.skip.tools/swift-jni.git", branch: "swift-java-jni-cutover"), // ### REMOVEME
    ],
    targets: [
        .target(name: "SkipBridge",
            dependencies: [.product(name: "SwiftJNI", package: "swift-jni"), .product(name: "SkipLib", package: "skip-lib")],
            swiftSettings: jniCoreSwiftSettings,
            plugins: [.plugin(name: "skipstone", package: "skip")]),
        .target(name: "SkipBridgeToKotlinSamples",
            dependencies: ["SkipBridgeToKotlinSamplesHelpers"],
            plugins: [.plugin(name: "skipstone", package: "skip")]),
        .target(name: "SkipBridgeToKotlinSamplesHelpers",
            dependencies: ["SkipBridge", .product(name: "SkipFoundation", package: "skip-foundation")],
                plugins: [.plugin(name: "skipstone", package: "skip")]),
        .target(name: "SkipBridgeToKotlinCompatSamples",
            dependencies: ["SkipBridge", .product(name: "SkipFoundation", package: "skip-foundation")],
            plugins: [.plugin(name: "skipstone", package: "skip")]),
        .target(name: "SkipBridgeToSwiftSamples",
            dependencies: ["SkipBridgeToSwiftSamplesHelpers"],
            plugins: [.plugin(name: "skipstone", package: "skip")]),
        .target(name: "SkipBridgeToSwiftSamplesHelpers",
            dependencies: ["SkipBridge", .product(name: "SkipFoundation", package: "skip-foundation")],
                plugins: [.plugin(name: "skipstone", package: "skip")]),
        .target(name: "SkipBridgeToSwiftSamplesTestsSupport",
            dependencies: ["SkipBridgeToSwiftSamples"],
                plugins: [.plugin(name: "skipstone", package: "skip")]),
        .testTarget(name: "SkipBridgeToKotlinSamplesTests",
            dependencies: ["SkipBridgeToKotlinSamples", .product(name: "SkipTest", package: "skip")],
            plugins: [.plugin(name: "skipstone", package: "skip")]),
        .testTarget(name: "SkipBridgeToKotlinCompatSamplesTests",
            dependencies: ["SkipBridgeToKotlinCompatSamples", .product(name: "SkipTest", package: "skip")],
            plugins: [.plugin(name: "skipstone", package: "skip")]),
        .testTarget(name: "SkipBridgeToSwiftSamplesTestsSupportTests",
            dependencies: ["SkipBridgeToSwiftSamplesTestsSupport", .product(name: "SkipTest", package: "skip")],
            plugins: [.plugin(name: "skipstone", package: "skip")]),
    ]
)

// SKIP_DEPENDENCY_ROOT overrides skiptools dependencies with local `.package(path:)` checkouts so this
// package can be built/tested against unreleased local changes (e.g. the swift-java-jni-core cutover).
// In CI/normal builds the variable is unset and remote versions resolve as usual.
if let dependencyRoot = Context.environment["SKIP_DEPENDENCY_ROOT"] {
    package.dependencies = package.dependencies.map { dep in
        switch dep.kind {
        case .sourceControl(_, let location, _):
            guard let baseName = location.split(separator: "/").last?.split(separator: ".").first else {
                return dep
            }
            // Remap skip* and swift-jni (the SWIFT_JAVA_JNI_CORE substrate; a direct dep here) to local;
            // leave swift-android-native on its declared fork URL.
            guard baseName.hasPrefix("skip") || baseName == "swift-jni" else {
                return dep
            }
            return Package.Dependency.package(path: dependencyRoot + "/" + baseName)
        default:
            return dep
        }
    }
}
