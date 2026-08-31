// Copyright 2024–2026 Skip
// SPDX-License-Identifier: MPL-2.0
import Foundation
import SkipBridge
import SkipBridgeToKotlinSamplesHelpers

// MARK: Global constants

public let swiftBoolConstant = true
// TODO: Char
public let swiftDoubleConstant = 1.0
public let swiftFloatConstant: Float = 2.0
public let swiftInt8Constant: Int8 = 3
public let swiftInt16Constant: Int16 = 4
public let swiftInt32Constant: Int32 = 5
public let swiftInt64Constant: Int64 = 6
public let swiftIntConstant = 7
public let swiftUnsignedInt8Constant = UInt8(200)
public let swiftUnsignedInt16Constant = UInt16(40_000)
public let swiftUnsignedInt32Constant = UInt32(3_000_000_000)
public let swiftUnsignedInt64Constant = UInt64(3_000_000_000)
public let swiftUnsignedIntConstant = UInt(3_000_000_000)
public let swiftStringConstant = "s"
public let swiftClassConstant = SwiftHelperClass()
public let swiftKotlinClassConstant = KotlinHelperClass()

// MARK: Global optional constants

public let swiftOptionalBoolConstant: Bool? = true
// TODO: Optional char
public let swiftOptionalDoubleConstant: Double? = 1.0
public let swiftOptionalFloatConstant: Float? = 2.0
public let swiftOptionalInt8Constant: Int8? = nil
public let swiftOptionalInt16Constant: Int16? = 3
public let swiftOptionalInt32Constant: Int32? = 4
public let swiftOptionalInt64Constant: Int64? = 5
public let swiftOptionalIntConstant: Int? = 6
public let swiftOptionalUnsignedInt8Constant: UInt8? = UInt8(200)
public let swiftOptionalUnsignedInt16Constant: UInt16? = UInt16(40_000)
public let swiftOptionalUnsignedInt32Constant: UInt32? = UInt32(3_000_000_000)
public let swiftOptionalUnsignedInt64Constant: UInt64? = UInt64(3_000_000_000)
public let swiftOptionalUnsignedIntConstant: UInt? = UInt(3_000_000_000)
public let swiftOptionalStringConstant: String? = "s"
public let swiftOptionalClassConstant: SwiftHelperClass? = SwiftHelperClass()
public let swiftOptionalKotlinClassConstant: KotlinHelperClass? = KotlinHelperClass()

// MARK: Global vars

public var swiftBoolVar = true
// TODO: Char
public var swiftDoubleVar = 1.0
public var swiftFloatVar: Float = 2.0
public var swiftInt8Var: Int8 = 3
public var swiftInt16Var: Int16 = 4
public var swiftInt32Var: Int32 = 5
public var swiftInt64Var: Int64 = 6
public var swiftIntVar = 7
public var swiftUnsignedInt8Var = UInt8(200)
public var swiftUnsignedInt16Var = UInt16(40_000)
public var swiftUnsignedInt32Var = UInt32(3_000_000_000)
public var swiftUnsignedInt64Var = UInt64(3_000_000_000)
public var swiftUnsignedIntVar = UInt(3_000_000_000)
public var swiftStringVar = "s"
public var swiftNSNumberVar = NSNumber(value: 100)
public var swiftClassVar = SwiftHelperClass()
public var swiftBaseClassVar = SwiftClass()
public var swiftInnerClassVar = SwiftHelperClass.Inner()
public var swiftKotlinClassVar = KotlinHelperClass()
public var swiftAnyVar: Any = "a"
public var swiftAnyHashableVar: AnyHashable = 1

// MARK: Global optional vars

public var swiftOptionalBoolVar: Bool? = true
// TODO: Optional char
public var swiftOptionalDoubleVar: Double? = 1.0
public var swiftOptionalFloatVar: Float? = 2.0
public var swiftOptionalInt8Var: Int8? = nil
public var swiftOptionalInt16Var: Int16? = 3
public var swiftOptionalInt32Var: Int32? = 4
public var swiftOptionalInt64Var: Int64? = 5
public var swiftOptionalIntVar: Int? = 6
public var swiftOptionalUnsignedInt8Var: UInt8? = UInt8(200)
public var swiftOptionalUnsignedInt16Var: UInt16? = UInt16(40_000)
public var swiftOptionalUnsignedInt32Var: UInt32? = UInt32(3_000_000_000)
public var swiftOptionalUnsignedInt64Var: UInt64? = UInt64(3_000_000_000)
public var swiftOptionalUnsignedIntVar: UInt? = UInt(3_000_000_000)
public var swiftOptionalStringVar: String? = "s"
public var swiftOptionalClassVar: SwiftHelperClass? = SwiftHelperClass()
public var swiftOptionalKotlinClassVar: KotlinHelperClass? = KotlinHelperClass()

// MARK: Global computed vars

public var swiftIntComputedVar: Int {
    get {
        return swiftIntVar
    }
    set {
        swiftIntVar = newValue
    }
}

public var swiftClassComputedVar: SwiftHelperClass {
    get {
        return swiftClassVar
    }
    set {
        swiftClassVar = newValue
    }
}

public var swiftKotlinClassComputedVar: KotlinHelperClass {
    get {
        return swiftKotlinClassVar
    }
    set {
        swiftKotlinClassVar = newValue
    }
}

// MARK: Classes

public class SwiftClass {
    public static let staticIntConstant = 1
    public static var staticIntVar = 1
    public static func staticFunc(string: String) -> String {
        return "swift" + string
    }

    public let intConstant = 1
    public let swiftClassConstant = SwiftHelperClass()

    public var intVar = 1
    public var optionalIntVar: Int? = nil

    public var swiftClassVar = SwiftHelperClass()
    public var optionalKotlinClassVar: KotlinHelperClass?

    public var optionalSwiftProtocolVar: (any SwiftProtocol)?
    public var optionalKotlinProtocolVar: (any KotlinProtocol)?

    public var swiftStructVar = SwiftStruct(string: "1")
    public var kotlinStructVar = KotlinStruct(string: "2")

    public let swiftGenericClassVar = SwiftGenericClass(value: 100)
    public var swiftGenericStructVar = SwiftGenericStruct(value: "a")
    public var swiftGenericEnumVar = SwiftGenericEnum.a(9, s: "a")

    public func updateSwiftGenericEnum() {
        swiftGenericEnumVar = .b
    }

    public init() {
    }
}


public final class SwiftSubclass: SwiftClass {
    public var stringVar: String

    public init(string: String) {
        self.stringVar = string
        super.init()
    }
}

public final class SwiftHelperClass: SwiftProtocol, SwiftGenericProtocol, Comparable, Identifiable {
    public var id: String {
        return stringVar
    }
    public var stringVar = "s"

    public init() {
    }

    public func stringValue() -> String {
        return stringVar
    }

    public func genericProtocolFunc(p: Int) -> Int {
        return p + 1
    }

    #if compiler(>=6.0) // needed for MainActor.assumeIsolated
    @MainActor public func mainActorFunc(p: Int) -> Int {
        return p
    }
    #endif

    public static func ==(lhs: SwiftHelperClass, rhs: SwiftHelperClass) -> Bool {
        return lhs.stringVar == rhs.stringVar
    }

    public func hash(into hasher: inout Hasher) {
        hasher.combine(stringVar)
    }

    public static func <(lhs: SwiftHelperClass, rhs: SwiftHelperClass) -> Bool {
        return lhs.stringVar < rhs.stringVar
    }

    public class Inner {
        public var intVar = 0

        public init() {
        }
    }
}

public protocol SwiftProtocol: Hashable {
    func stringValue() -> String
}

public protocol SwiftGenericProtocol {
    associatedtype T
    func genericProtocolFunc(p: T) -> T
}

public protocol SwiftAsyncProtocol {
    var intValue: Int { get async }
    func stringValue() async throws -> String
}

extension SwiftProtocol {
    public func stringValue() -> String {
        return "<default>"
    }

    public var protocolExtensionVar: Int {
        return 0
    }
}

public struct SwiftStruct {
    public var intVar = 1

    public init(string: String) {
        self.intVar = Int(string) ?? 0
    }

    public func intFunc() -> Int {
        return intVar
    }

    public mutating func setIntFunc(_ i: Int) {
        self.intVar = i
    }
}

public enum SwiftEnum: String, CaseIterable {
    case name
    case age = "years"

    public func isName() -> Bool {
        return self == .name
    }

    public var intValue: Int {
        switch self {
        case .name: return 0
        case .age: return 1
        }
    }

    public init(intValue: Int) {
        switch intValue {
        case 0: self = .name
        default: self = .age
        }
    }
}

public enum SwiftAssociatedValuesEnum {
    case a(i: Int, String)
    case b

    public static var caseNames: String {
        return "a,b"
    }

    public var intValue: Int? {
        switch self {
        case .a(let i, _):
            return i
        case .b:
            return nil
        }
    }

    public func stringValue() -> String {
        switch self {
        case .a(_, let s):
            return s
        case .b:
            return ".b"
        }
    }
}

public class SwiftGenericClass<T> {
    public var value: T
    #if compiler(>=6.0) // needed for MainActor.assumeIsolated
    @MainActor public var mainActorValue: T? = nil
    #endif

    // SKIP @nobridge
    public init(value: T) {
        self.value = value
    }

    public func identity(value: T, _ i: Int) -> T {
        return value
    }
}

public struct SwiftGenericStruct<T> {
    public var value: T

    // SKIP @nobridge
    public init(value: T) {
        self.value = value
    }

    public func identity(value: T, _ i: Int) -> T {
        return value
    }
    public mutating func update(value: T) {
        self.value = value
    }
}

public enum SwiftGenericEnum<T> {
    case a(T, s: String)
    case b

    public var value: T? {
        switch self {
        case .a(let value, _):
            return value
        case .b:
            return nil
        }
    }

    public func stringValue() -> String {
        switch self {
        case .a(_, let s):
            return s
        case .b:
            return ".b"
        }
    }
}

public actor SwiftActor {
    public nonisolated let nonisolatedLet = "nonisolated"

    public var intVar: Int {
        get {
            return _intVar
        }
    }
    private var _intVar: Int

    public func setIntVar(_ i: Int) {
        _intVar = i
    }

    public nonisolated func nonisolatedFunc(_ i: Int) -> Int {
        return i
    }

    public init(_ value: Int) {
        _intVar = value
    }
}

public struct SwiftError: Error {
    public init() {
    }
}

public enum SwiftEnumError: Error {
    case intError(Int)
    case stringError(String)
}

// MARK: Closures

public var swiftClosure0Var: () -> Void = { print("original") }
public var swiftClosure1Var: (Int) -> String = { i in "value = \(i)" }
public var swiftClosure1PrimitivesVar: (Int64) -> Int = { l in Int(l / 1000) }
public var swiftClosure1OptionalsVar: (String?) -> Int? = { s in s?.count }

// MARK: Async Closures

public var swiftAsyncClosure0Var: () async -> Void = { print("original") }
public var swiftAsyncClosure1Var: (Int) async -> String = { i in "value = \(i)" }
public var swiftAsyncClosure1PrimitivesVar: (Int64) async -> Int = { l in Int(l / 1000) }
public var swiftAsyncClosure1OptionalsVar: (String?) async -> Int? = { s in s?.count }
public var swiftAsyncClosure2Var: (Int64, Int32) async -> Double = { Double($0) + Double($1) }
public var swiftAsyncClosure3Var: (Int64, Int32, Int16) async -> Double = { Double($0) + Double($1) + Double($2) }
public var swiftAsyncClosure4Var: (Int64, Int32, Int16, Double) async -> Double = { Double($0) + Double($1) + Double($2) + Double($3) }
public var swiftAsyncClosure5Var: (Int64, Int32, Int16, Double, Float) async -> Double = { Double($0) + Double($1) + Double($2) + Double($3) + Double($4) }

public var swiftAsyncClosure1ThrowsVar: (String) async throws -> Int = { s in s.count }

// MARK: Containers

public var swiftIntArrayVar = [1, 2, 3]
public var swiftStringSetVar: Set<String> = ["a", "b", "c"]
public var swiftIntStringDictionaryVar = [1: "a", 2: "b", 3: "c"]
public var swiftIntStringTuple = (1, "s")
public var swiftIntErrorResult: Result<Int, SwiftError> = .success(1)
public var swiftHashable1: AnyHashable = SwiftHashable(HashableEnum.first)
public var swiftHashable2: AnyHashable = SwiftHashable(HashableEnum.first)
public var swiftHashable3: AnyHashable = SwiftHashable(HashableEnum.second)

// SKIP @nobridge
public enum HashableEnum : Hashable {
    case first
    case second
}

// MARK: Functions

public func swiftThrowingFunction(shouldThrow: Bool) throws -> Int {
    if shouldThrow {
        throw SwiftSampleError()
    } else {
        return 1
    }
}

public func swiftThrowingVoidFunction(shouldThrow: Bool) throws {
    if shouldThrow {
        throw SwiftSampleError()
    }
}

public func swiftThrowingBridgedErrorFunction(shouldThrow: Bool) throws {
    if shouldThrow {
        throw SwiftError()
    }
}

public func swiftThrowingBridgedEnumErrorFunction(throw value: Int?) throws {
    if let value {
        throw SwiftEnumError.intError(value)
    }
}

public func swiftUnsignedParametersFunction(p0: UInt, p1: UInt?) -> UInt {
    return p0
}

// MARK: Async

public var swiftAsyncThrowsVar: Int {
    get async throws {
        try? await Task.sleep(nanoseconds: 10_000_000)
        return 1
    }
}

public func swiftAsync0Function() async {
    try? await Task.sleep(nanoseconds: 10_000_000)
}

public func swiftAsync1Function(i: Int) async -> Int {
    try? await Task.sleep(nanoseconds: 10_000_000)
    return i + 1
}

public func swiftAsyncThrowingFunction(shouldThrow: Bool) async throws -> Int {
    if shouldThrow {
        throw SwiftSampleError()
    } else {
        return 1
    }
}

public func swiftAsyncThrowingVoidFunction(shouldThrow: Bool) async throws {
    if shouldThrow {
        throw SwiftSampleError()
    }
}

public func swiftMakeAsyncStream() -> AsyncStream<Int> {
    let (stream, continuation) = AsyncStream.makeStream(of: Int.self)
    continuation.yield(100)
    continuation.yield(200)
    continuation.finish()
    return stream
}

public func swiftRoundtripAsyncStream(_ stream: AsyncStream<Int>) -> AsyncStream<Int> {
    return stream
}

public func swiftMakeAsyncThrowingStream(throwing: Bool) -> AsyncThrowingStream<String, Error> {
    let (stream, continuation) = AsyncThrowingStream.makeStream(of: String.self)
    continuation.yield("100")
    continuation.yield("200")
    continuation.finish(throwing: throwing ? SwiftError() : nil)
    return stream
}

public func swiftRoundtripAsyncThrowingStream(_ stream: AsyncThrowingStream<String, Error>) -> AsyncThrowingStream<String, Error> {
    return stream
}

// MARK: Unicode

public let swiftUTF8StringVar1 = "😀" + ""
public let swiftUTF8StringVar2 = "🚀" + "123" + "456"
public let swiftUTF8StringVar3 = "😀" + "🚀"

// MARK: Bridged Types

public func swiftMakeURL(matching url: URL) -> URL? {
    return URL(string: url.absoluteString)
}

public func swiftMakeUUID(matching uuid: UUID) -> UUID? {
    return UUID(uuidString: uuid.uuidString)
}

public func swiftMakeData(matching data: Data) -> Data {
    var copy = Data()
    copy.append(data)
    return copy
}

public func swiftMakeDate(matching date: Date) -> Date {
    return Date(timeIntervalSinceReferenceDate: date.timeIntervalSinceReferenceDate)
}

public func swiftMakeLocale(matching locale: Locale) -> Locale {
    return Locale(identifier: locale.identifier)
}

struct SwiftSampleError: Error {
}

// MARK: Sanity check
// This code is not supported by our transpiler and ensures that we're compiling to native Swift

public func multiplyInt32s(i1: Int32, i2: Int32) -> Int32 {
    i1.multiplex(with: i2)
}

protocol Multiplex {
    func multiplex(with: Self) -> Self
}

extension Multiplex where Self : Numeric {
    func multiplex(with: Self) -> Self {
        self * with
    }
}

extension Int8 : Multiplex { }
extension Int16 : Multiplex { }
extension Int32 : Multiplex { }
extension Int64 : Multiplex { }
extension UInt8 : Multiplex { }
extension UInt16 : Multiplex { }
extension UInt32 : Multiplex { }
extension UInt64 : Multiplex { }
extension Float : Multiplex { }
extension Double : Multiplex { }
