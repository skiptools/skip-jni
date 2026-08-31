// Copyright 2024–2026 Skip
// SPDX-License-Identifier: MPL-2.0
import Foundation
import SkipBridge
import SkipBridgeToKotlinSamples
import SkipBridgeToKotlinSamplesHelpers
import XCTest

final class BridgeToKotlinTests: XCTestCase {
    override func setUp() {
        #if SKIP
        loadPeerLibrary(packageName: "skip-bridge", moduleName: "SkipBridgeToKotlinSamples")
        #endif
    }

    func testSimpleConstants() {
        XCTAssertEqual(swiftBoolConstant, true)
        XCTAssertEqual(swiftDoubleConstant, 1.0)
        XCTAssertEqual(swiftFloatConstant, Float(2.0))
        XCTAssertEqual(swiftInt8Constant, Int8(3))
        XCTAssertEqual(swiftInt16Constant, Int16(4))
        XCTAssertEqual(swiftInt32Constant, Int32(5))
        XCTAssertEqual(swiftInt64Constant, Int64(6))
        XCTAssertEqual(swiftIntConstant, 7)
        XCTAssertEqual(swiftStringConstant, "s")
    }

    func testUnsignedConstants() {
        XCTAssertEqual(swiftUnsignedInt8Constant, UInt8(200))
        XCTAssertEqual(swiftUnsignedInt16Constant, UInt16(40_000))
        XCTAssertEqual(swiftUnsignedInt32Constant, UInt32(3_000_000_000))
        XCTAssertEqual(swiftUnsignedInt64Constant, UInt64(3_000_000_000))
        XCTAssertEqual(swiftUnsignedIntConstant, UInt(3_000_000_000))
    }

    func testSwiftClassConstant() {
        XCTAssertEqual(swiftClassConstant.stringVar, "s")
    }

    func testKotlinClassConstant() {
        XCTAssertEqual(testSupport_swiftKotlinClassConstant_stringVar(), "s")
    }

    func testOptionalConstants() {
        XCTAssertEqual(swiftOptionalBoolConstant, true)
        XCTAssertEqual(swiftOptionalDoubleConstant, 1.0)
        XCTAssertEqual(swiftOptionalFloatConstant, Float(2.0))
        XCTAssertNil(swiftOptionalInt8Constant)
        XCTAssertEqual(swiftOptionalInt16Constant, Int16(3))
        XCTAssertEqual(swiftOptionalInt32Constant, Int32(4))
        XCTAssertEqual(swiftOptionalInt64Constant, Int64(5))
        XCTAssertEqual(swiftOptionalIntConstant, 6)
        XCTAssertEqual(swiftOptionalStringConstant, "s")
    }

    func testUnsignedOptionalConstants() {
        XCTAssertEqual(swiftOptionalUnsignedInt8Constant, UInt8(200))
        XCTAssertEqual(swiftOptionalUnsignedInt16Constant, UInt16(40_000))
        XCTAssertEqual(swiftOptionalUnsignedInt32Constant, UInt32(3_000_000_000))
        XCTAssertEqual(swiftOptionalUnsignedInt64Constant, UInt64(3_000_000_000))
        XCTAssertEqual(swiftOptionalUnsignedIntConstant, UInt(3_000_000_000))
    }

    func testSimpleVars() {
        swiftBoolVar = false
        XCTAssertEqual(swiftBoolVar, false)
        swiftDoubleVar = 101.0
        XCTAssertEqual(swiftDoubleVar, 101.0)
        swiftFloatVar = Float(102.0)
        XCTAssertEqual(swiftFloatVar, Float(102.0))
        swiftInt8Var = Int8(103)
        XCTAssertEqual(swiftInt8Var, Int8(103))
        swiftInt16Var = Int16(104)
        XCTAssertEqual(swiftInt16Var, Int16(104))
        swiftInt32Var = Int32(105)
        XCTAssertEqual(swiftInt32Var, Int32(105))
        swiftInt64Var = Int64(106)
        XCTAssertEqual(swiftInt64Var, Int64(106))
        swiftIntVar = 107
        XCTAssertEqual(swiftIntVar, 107)
        swiftStringVar = "ss"
        XCTAssertEqual(swiftStringVar, "ss")
        swiftNSNumberVar = NSNumber(value: 10.5)
        XCTAssertEqual(swiftNSNumberVar, NSNumber(value: 10.5))
    }

    func testUnsignedVars() {
        swiftUnsignedInt8Var = UInt8(201)
        XCTAssertEqual(swiftUnsignedInt8Var, UInt8(201))
        swiftUnsignedInt16Var = UInt16(40_001)
        XCTAssertEqual(swiftUnsignedInt16Var, UInt16(40_001))
        swiftUnsignedInt32Var = UInt32(3_000_000_001)
        XCTAssertEqual(swiftUnsignedInt32Var, UInt32(3_000_000_001))
        swiftUnsignedInt64Var = UInt64(3_000_000_001)
        XCTAssertEqual(swiftUnsignedInt64Var, UInt64(3_000_000_001))
        swiftUnsignedIntVar = UInt(3_000_000_001)
        XCTAssertEqual(swiftUnsignedIntVar, UInt(3_000_000_001))
    }

    func testSwiftClassVar() {
        let value = SwiftHelperClass()
        value.stringVar = "ss"
        swiftClassVar = value
        XCTAssertEqual(swiftClassVar.stringVar, "ss")
    }

    func testSwiftInnerClassVar() {
        let inner = SwiftHelperClass.Inner()
        inner.intVar = 2
        swiftInnerClassVar = inner
        XCTAssertEqual(swiftInnerClassVar.intVar, 2)
    }

    func testKotlinClassVar() {
        XCTAssertEqual(testSupport_swiftKotlinClassVar_stringVar(value: "ss"), "ss")
    }

    func testAnyVar() {
        swiftAnyVar = 1
        XCTAssertEqual(swiftAnyVar as? Int, 1)

        swiftAnyVar = "a"
        XCTAssertEqual(swiftAnyVar as? String, "a")

        let helper = SwiftHelperClass()
        swiftAnyVar = helper
        XCTAssertTrue(swiftAnyVar is SwiftHelperClass)
        XCTAssertEqual(swiftAnyVar as? SwiftHelperClass, helper)
    }

    func testAnyHashableVar() {
        swiftAnyHashableVar = 1
        XCTAssertEqual(swiftAnyHashableVar as? Int, 1)

        let helper = SwiftHelperClass()
        swiftAnyHashableVar = helper
        XCTAssertTrue(swiftAnyHashableVar is SwiftHelperClass)
        XCTAssertEqual(swiftAnyHashableVar as? SwiftHelperClass, helper)
    }

    func testAnyVarContainerValues() {
        swiftAnyVar = ["a", 2, 3.0]
        guard let anyArray = swiftAnyVar as? [Any] else {
            return XCTFail()
        }
        XCTAssertEqual(anyArray[0] as? String, "a")
        XCTAssertEqual(anyArray[1] as? Int, 2)
        XCTAssertEqual(anyArray[2] as? Double, 3.0)

        swiftAnyVar = ["a": 1, "b": 2]
        guard let anyDictionary = swiftAnyVar as? [AnyHashable: Any] else {
            return XCTFail()
        }
        XCTAssertEqual(anyDictionary["a"] as? Int, 1)
        XCTAssertEqual(anyDictionary["b"] as? Int, 2)
    }

    func testOptionalSimpleVars() {
        swiftOptionalBoolVar = false
        XCTAssertEqual(swiftOptionalBoolVar, false)
        swiftOptionalBoolVar = nil
        XCTAssertNil(swiftOptionalBoolVar)
        swiftOptionalDoubleVar = 101.0
        XCTAssertEqual(swiftOptionalDoubleVar, 101.0)
        swiftOptionalDoubleVar = nil
        XCTAssertNil(swiftOptionalDoubleVar)
        swiftOptionalFloatVar = Float(102.0)
        XCTAssertEqual(swiftOptionalFloatVar, Float(102.0))
        swiftOptionalFloatVar = nil
        XCTAssertNil(swiftOptionalFloatVar)
        swiftOptionalInt8Var = Int8(103)
        XCTAssertEqual(swiftOptionalInt8Var, Int8(103))
        swiftOptionalInt8Var = nil
        XCTAssertNil(swiftOptionalInt8Var)
        swiftOptionalInt16Var = Int16(104)
        XCTAssertEqual(swiftOptionalInt16Var, Int16(104))
        swiftOptionalInt16Var = nil
        XCTAssertNil(swiftOptionalInt16Var)
        swiftOptionalInt32Var = Int32(105)
        XCTAssertEqual(swiftOptionalInt32Var, Int32(105))
        swiftOptionalInt32Var = nil
        XCTAssertNil(swiftOptionalInt32Var)
        swiftOptionalInt64Var = Int64(106)
        XCTAssertEqual(swiftOptionalInt64Var, Int64(106))
        swiftOptionalInt64Var = nil
        XCTAssertNil(swiftOptionalInt64Var)
        swiftOptionalIntVar = 107
        XCTAssertEqual(swiftOptionalIntVar, 107)
        swiftOptionalIntVar = nil
        XCTAssertNil(swiftOptionalIntVar)
        swiftOptionalStringVar = "ss"
        XCTAssertEqual(swiftOptionalStringVar, "ss")
        swiftOptionalStringVar = nil
        XCTAssertNil(swiftOptionalStringVar)
    }

    func testOptionalUnsignedVars() {
        swiftOptionalUnsignedInt8Var = UInt8(201)
        XCTAssertEqual(swiftOptionalUnsignedInt8Var, UInt8(201))
        swiftOptionalUnsignedInt8Var = nil
        XCTAssertNil(swiftOptionalUnsignedInt8Var)
        swiftOptionalUnsignedInt16Var = UInt16(40_001)
        XCTAssertEqual(swiftOptionalUnsignedInt16Var, UInt16(40_001))
        swiftOptionalUnsignedInt16Var = nil
        XCTAssertNil(swiftOptionalUnsignedInt16Var)
        swiftOptionalUnsignedInt32Var = UInt32(3_000_000_001)
        XCTAssertEqual(swiftOptionalUnsignedInt32Var, UInt32(3_000_000_001))
        swiftOptionalUnsignedInt32Var = nil
        XCTAssertNil(swiftOptionalUnsignedInt32Var)
        swiftOptionalUnsignedInt64Var = UInt64(3_000_000_001)
        XCTAssertEqual(swiftOptionalUnsignedInt64Var, UInt64(3_000_000_001))
        swiftOptionalUnsignedInt64Var = nil
        XCTAssertNil(swiftOptionalUnsignedInt64Var)
        swiftOptionalUnsignedIntVar = UInt(3_000_000_001)
        XCTAssertEqual(swiftOptionalUnsignedIntVar, UInt(3_000_000_001))
        swiftOptionalUnsignedIntVar = nil
        XCTAssertNil(swiftOptionalUnsignedIntVar)
    }

    func testOptionalSwiftClassVar() {
        let value = SwiftHelperClass()
        value.stringVar = "ss"
        swiftOptionalClassVar = value
        XCTAssertEqual(swiftOptionalClassVar?.stringVar, "ss")
        swiftOptionalClassVar = nil
        XCTAssertNil(swiftOptionalClassVar)
    }

    func testOptionalKotlinClassVar() {
        XCTAssertEqual(testSupport_swiftOptionalKotlinClassVar_stringVar(value: "ss"), "ss")
        XCTAssertNil(testSupport_swiftOptionalKotlinClassVar_stringVar(value: nil))
    }

    func testComputedVar() {
        swiftIntComputedVar = 99
        XCTAssertEqual(swiftIntComputedVar, 99)
    }

    func testComputedSwiftClassVar() {
        let value = SwiftHelperClass()
        value.stringVar = "computed"
        swiftClassComputedVar = value
        XCTAssertEqual(swiftClassComputedVar.stringVar, "computed")
    }

    func testComputedKotlinClassVar() {
        XCTAssertEqual(testSupport_swiftKotlinClassComputedVar_stringVar(value: "computed"), "computed")
    }

    func testSwiftClassMemberConstant() {
        let value = SwiftClass()
        XCTAssertEqual(value.intConstant, 1)
    }

    func testSwiftClassMemberVar() {
        let value = SwiftClass()
        value.intVar = 99
        XCTAssertEqual(value.intVar, 99)
    }

    func testSwiftClassMemberOptionalVar() {
        let value = SwiftClass()
        value.optionalIntVar = 100
        XCTAssertEqual(value.optionalIntVar, 100)
        value.optionalIntVar = nil
        XCTAssertNil(value.optionalIntVar)
    }

    func testSwiftClassMemberSwiftClassConstant() {
        let value = SwiftClass()
        XCTAssertEqual(value.swiftClassConstant.stringVar, "s")
    }

    func testSwiftClassMemberSwiftClassVar() {
        let helper = SwiftHelperClass()
        helper.stringVar = "member"
        let value = SwiftClass()
        value.swiftClassVar = helper
        XCTAssertEqual(value.swiftClassVar.stringVar, "member")
    }

    func testSwiftClassMemberKotlinClassVar() {
        XCTAssertEqual(testSupport_swiftKotlinClassMemberVar_stringVar(value: "member"), "member")
    }

    func testSwiftClassMemberStaticConstant() {
        XCTAssertEqual(SwiftClass.staticIntConstant, 1)
    }

    func testSwiftClassMemberStaticVar() {
        SwiftClass.staticIntVar = 99
        XCTAssertEqual(SwiftClass.staticIntVar, 99)
    }

    func testSwiftClassMemberStaticFunc() {
        XCTAssertEqual(SwiftClass.staticFunc(string: "Hello"), "swiftHello")
    }

    public func testSwiftClassEquatable() {
        let lhs = SwiftHelperClass()
        lhs.stringVar = "Hello"
        let rhs = SwiftHelperClass()
        rhs.stringVar = "Hello"
        XCTAssertEqual(lhs, rhs)

        rhs.stringVar = "Goodbye"
        XCTAssertNotEqual(lhs, rhs)
    }

    public func testSwiftClassHashable() {
        let lhs = SwiftHelperClass()
        lhs.stringVar = "Hello"
        let rhs = SwiftHelperClass()
        rhs.stringVar = "Hello"
        XCTAssertEqual(lhs.hashValue, rhs.hashValue)

        rhs.stringVar = "Goodbye"
        XCTAssertNotEqual(lhs.hashValue, rhs.hashValue)
    }

    public func testSwiftClassComparable() {
        let lhs = SwiftHelperClass()
        lhs.stringVar = "aaa"
        let rhs = SwiftHelperClass()
        rhs.stringVar = "bbb"
        XCTAssertTrue(lhs < rhs)

        lhs.stringVar = "bbb"
        rhs.stringVar = "aaa"
        XCTAssertFalse(lhs < rhs)
    }

    public func testSwiftSubclass() {
        let sub = SwiftSubclass(string: "sub")
        sub.intVar = 100
        XCTAssertEqual(sub.stringVar, "sub")
        XCTAssertEqual(sub.intVar, 100)

        swiftBaseClassVar = sub
        swiftBaseClassVar.intVar = 101

        let sub2 = swiftBaseClassVar as? SwiftSubclass
        XCTAssertNotNil(sub2)
        XCTAssertEqual(sub2?.stringVar, "sub")
        XCTAssertEqual(sub2?.intVar, 101)
    }

    public func testSwiftProtocolMember() {
        let obj = SwiftClass()
        obj.optionalSwiftProtocolVar = nil
        XCTAssertNil(obj.optionalSwiftProtocolVar)

        let helper = SwiftHelperClass()
        helper.stringVar = "foo"
        obj.optionalSwiftProtocolVar = helper
        XCTAssertEqual(obj.optionalSwiftProtocolVar?.stringValue(), "foo")
        XCTAssertTrue(obj.optionalSwiftProtocolVar is SwiftHelperClass)
        XCTAssertEqual(obj.optionalSwiftProtocolVar?.hashValue, helper.hashValue)
    }

    public func testKotlinProtocolMember() {
        let obj = SwiftClass()
        obj.optionalKotlinProtocolVar = nil
        XCTAssertNil(obj.optionalKotlinProtocolVar)

        let helper = KotlinHelperClass()
        helper.stringVar = "foo"
        obj.optionalKotlinProtocolVar = helper
        XCTAssertEqual(obj.optionalKotlinProtocolVar?.stringValue(), "foo")
        XCTAssertTrue(obj.optionalKotlinProtocolVar is KotlinHelperClass)
        XCTAssertEqual(obj.optionalKotlinProtocolVar?.hashValue, helper.hashValue)
    }

    public func testSwiftProtocolExtension() {
        let helper = SwiftHelperClass()
        helper.stringVar = "foo"
        XCTAssertEqual(helper.stringVar, "foo")
        XCTAssertEqual(helper.protocolExtensionVar, 0)
    }

    public func testStruct() {
        let s1 = SwiftStruct(string: "2")
        XCTAssertEqual(s1.intVar, 2)

        var s2 = s1
        XCTAssertEqual(s1.intVar, 2)
        s2.intVar = 3
        XCTAssertEqual(s1.intVar, 2)
        XCTAssertEqual(s2.intVar, 3)

        s2.setIntFunc(4)
        XCTAssertEqual(s1.intVar, 2)
        XCTAssertEqual(s2.intVar, 4)
    }

    public func testSwiftStructMember() {
        let obj = SwiftClass()
        var s1 = SwiftStruct(string: "2")
        obj.swiftStructVar = s1

        s1.intVar = 3
        XCTAssertEqual(s1.intVar, 3)
        XCTAssertEqual(obj.swiftStructVar.intVar, 2)

        obj.swiftStructVar.intVar = 99
        var s2 = obj.swiftStructVar
        s2.intVar = 100
        XCTAssertEqual(s1.intVar, 3)
        XCTAssertEqual(s2.intVar, 100)
        XCTAssertEqual(obj.swiftStructVar.intVar, 99)
    }

    public func testKotlinStructMember() {
        let obj = SwiftClass()
        var s1 = KotlinStruct(string: "2")
        obj.kotlinStructVar = s1

        s1.intVar = 3
        XCTAssertEqual(s1.intVar, 3)
        XCTAssertEqual(obj.kotlinStructVar.intVar, 2)

        obj.kotlinStructVar.intVar = 99
        var s2 = obj.kotlinStructVar
        s2.intVar = 100
        XCTAssertEqual(s1.intVar, 3)
        XCTAssertEqual(s2.intVar, 100)
        XCTAssertEqual(obj.kotlinStructVar.intVar, 99)
    }

    public func testEnum() {
        let e1: SwiftEnum = .age
        XCTAssertFalse(e1.isName())
        XCTAssertEqual(e1.rawValue, "years")
        XCTAssertEqual(e1.intValue, 1)

        let e2 = SwiftEnum(intValue: 0)
        XCTAssertTrue(e2 == .name)
        XCTAssertTrue(e2.isName())

        XCTAssertEqual(SwiftEnum.allCases.count, 2)
    }

    public func testAssociatedValuesEnum() {
        XCTAssertEqual(SwiftAssociatedValuesEnum.caseNames, "a,b")
        let a: SwiftAssociatedValuesEnum = .a(i: 99, "s")
        XCTAssertEqual(a.intValue, 99)
        XCTAssertEqual(a.stringValue(), "s")

        let b: SwiftAssociatedValuesEnum = .b
        XCTAssertNil(b.intValue)
        XCTAssertEqual(b.stringValue(), ".b")

        switch a {
        case .a(let i, let s):
            XCTAssertEqual(i, 99)
            XCTAssertEqual(s, "s")
        case .b:
            XCTFail()
        }
    }

    public func testActor() async {
        let a = SwiftActor(99)
        let value1 = await a.intVar
        XCTAssertEqual(value1, 99)

        await a.setIntVar(100)
        let value2 = await a.intVar
        XCTAssertEqual(value2, 100)
    }

    public func testGenericClass() {
        let c = SwiftClass()
        let g = c.swiftGenericClassVar
        XCTAssertEqual(100, g.value)
        XCTAssertEqual(99, g.identity(value: 99, 1))

        g.value = 101
        XCTAssertEqual(101, g.value)
    }

    public func testGenericStruct() {
        let c = SwiftClass()
        var g = c.swiftGenericStructVar
        XCTAssertEqual("a", g.value)
        XCTAssertEqual("a", g.identity(value: "a", 1))

        g.value = "b"
        XCTAssertEqual("b", g.value)
        XCTAssertEqual("a", c.swiftGenericStructVar.value)

        c.swiftGenericStructVar.value = "c"
        XCTAssertEqual("b", g.value)
        XCTAssertEqual("c", c.swiftGenericStructVar.value)

        c.swiftGenericStructVar.update(value: "d")
        XCTAssertEqual("d", c.swiftGenericStructVar.value)
    }

    public func testGenericEnum() {
        let c = SwiftClass()
        switch c.swiftGenericEnumVar {
        case .a(let value, let s):
            XCTAssertEqual(value, 9)
            XCTAssertEqual(s, "a")
        case .b:
            XCTFail(".b")
        }
        XCTAssertEqual(c.swiftGenericEnumVar.value, 9)
        XCTAssertEqual(c.swiftGenericEnumVar.stringValue(), "a")

        c.updateSwiftGenericEnum()
        let e = c.swiftGenericEnumVar
        switch e {
        case .a:
            XCTFail(".b")
        case .b:
            break
        }
        XCTAssertNil(e.value)
        XCTAssertEqual(e.stringValue(), ".b")
    }

    public func testAsyncProtocol() async throws {
        let protocolImpl = SwiftAsyncProtocolImpl()
        let intValue = await protocolImpl.intValue
        XCTAssertEqual(intValue, 99)
        let stringValue = try await protocolImpl.stringValue()
        XCTAssertEqual(stringValue, "string")
    }

    public func testClosure0Var() {
        swiftClosure0Var()
        swiftClosure0Var = { print("reassigned") }
        swiftClosure0Var()
    }

    // FIXME: test hangs intermittently on Android
    public func XXXtestAsyncClosure0Var() async {
        await swiftAsyncClosure0Var()
        swiftAsyncClosure0Var = { try? await Task.sleep(nanoseconds: 1000) }
        await swiftAsyncClosure0Var()
    }

    public func testClosure1Var() {
        let orig = swiftClosure1Var
        XCTAssertEqual(swiftClosure1Var(99), "value = 99")
        swiftClosure1Var = { i in "kotlin = \(i)" }
        XCTAssertEqual(swiftClosure1Var(99), "kotlin = 99")
        swiftClosure1Var = orig
        XCTAssertEqual(swiftClosure1Var(99), "value = 99")
    }

    // FIXME: test hangs intermittently on Android
    public func XXXtestAsyncClosure1Var() async {
        let orig = swiftAsyncClosure1Var
        let r1 = await swiftAsyncClosure1Var(99)
        XCTAssertEqual(r1, "value = 99")
        swiftAsyncClosure1Var = { i in "kotlin = \(i)" }
        let r2 = await swiftAsyncClosure1Var(99)
        XCTAssertEqual(r2, "kotlin = 99")
        swiftAsyncClosure1Var = orig
        let r3 = await swiftAsyncClosure1Var(99)
        XCTAssertEqual(r3, "value = 99")
    }

    public func testClosure1PrimitivesVar() {
        XCTAssertEqual(swiftClosure1PrimitivesVar(Int64(3000)), 3)
        swiftClosure1PrimitivesVar = { l in Int(l / 500) }
        XCTAssertEqual(swiftClosure1PrimitivesVar(Int64(3000)), 6)
    }

    // FIXME: test hangs intermittently on Android
    public func XXXtestAsyncClosure1PrimitivesVar() async {
        let r1 = await swiftAsyncClosure1PrimitivesVar(Int64(3000))
        XCTAssertEqual(r1, 3)
        swiftAsyncClosure1PrimitivesVar = { l in Int(l / 500) }
        let r2 = await swiftAsyncClosure1PrimitivesVar(Int64(3000))
        XCTAssertEqual(r2, 6)
    }

    public func testClosure1OptionalsVar() {
        XCTAssertEqual(swiftClosure1OptionalsVar("abc"), 3)
        XCTAssertNil(swiftClosure1OptionalsVar(nil))
        swiftClosure1OptionalsVar = { s in
            if let s {
                return s.count * 2
            } else {
                return nil
            }
        }
        XCTAssertEqual(swiftClosure1OptionalsVar("abc"), 6)
        XCTAssertNil(swiftClosure1OptionalsVar(nil))
    }

    // FIXME: test hangs intermittently on Android
    public func XXXtestAsyncClosure1OptionalsVar() async {
        let r1 = await swiftAsyncClosure1OptionalsVar("abc")
        XCTAssertEqual(r1, 3)
        let r2 = await swiftAsyncClosure1OptionalsVar(nil)
        XCTAssertNil(r2)
        swiftAsyncClosure1OptionalsVar = { s in
            if let s {
                return s.count * 2
            } else {
                return nil
            }
        }
        let r3 = await swiftAsyncClosure1OptionalsVar("abc")
        XCTAssertEqual(r3, 6)
        let r4 = await swiftAsyncClosure1OptionalsVar(nil)
        XCTAssertNil(r4)
    }

    public func testAsyncClosure1ThrowsVar() async throws {
        let r1 = try await swiftAsyncClosure1ThrowsVar("abc")
        XCTAssertEqual(r1, 3)
        swiftAsyncClosure1ThrowsVar = { s in
            throw SwiftError()
        }
        do {
            let _ = try await swiftAsyncClosure1ThrowsVar("abc")
            XCTFail("closure should have thrown an error")
        } catch {
            // expected
        }
    }

    // FIXME: test hangs intermittently on Android
    public func XXXtestAsyncClosureNVar() async {
        do {
            let r1 = await swiftAsyncClosure2Var(Int64(1), Int32(2))
            XCTAssertEqual(r1, Double(1 + 2))
            swiftAsyncClosure2Var = { Double($0) * Double($1) }
            let r2 = await swiftAsyncClosure2Var(Int64(1), Int32(2))
            XCTAssertEqual(r2, Double(1 * 2))
        }

        do {
            let r1 = await swiftAsyncClosure3Var(Int64(1), Int32(2), Int16(3))
            XCTAssertEqual(r1, Double(1 + 2 + 3))
            swiftAsyncClosure3Var = { Double($0) * Double($1) * Double($2) }
            let r2 = await swiftAsyncClosure3Var(Int64(1), Int32(2), Int16(3))
            XCTAssertEqual(r2, Double(1 * 2 * 3))
        }

        do {
            let r1 = await swiftAsyncClosure4Var(Int64(1), Int32(2), Int16(3), Double(4.0))
            XCTAssertEqual(r1, Double(1 + 2 + 3 + 4))
            swiftAsyncClosure4Var = { Double($0) * Double($1) * Double($2) * Double($3) }
            let r2 = await swiftAsyncClosure4Var(Int64(1), Int32(2), Int16(3), Double(4.0))
            XCTAssertEqual(r2, Double(1 * 2 * 3 * 4))
        }

        do {
            let r1 = await swiftAsyncClosure5Var(Int64(1), Int32(2), Int16(3), Double(4.0), Float(5.0))
            XCTAssertEqual(r1, 15.0) // Double(1 + 2 + 3 + 4 + 5)) // “The compiler is unable to type-check this expression in reasonable time; try breaking up the expression into distinct sub-expressions”
            swiftAsyncClosure5Var = { Double($0) * Double($1) * Double($2) * Double($3) * Double($4) }
            let r2 = await swiftAsyncClosure5Var(Int64(1), Int32(2), Int16(3), Double(4.0), Float(5.0))
            XCTAssertEqual(r2, Double(1 * 2 * 3 * 4 * 5))
        }
    }

    func testArrays() {
        XCTAssertEqual(swiftIntArrayVar, [1, 2, 3])
        XCTAssertEqual(swiftIntArrayVar[1], 2)
        swiftIntArrayVar = [4, 5, 6, 7]
        XCTAssertEqual(swiftIntArrayVar, [4, 5, 6, 7])
        XCTAssertEqual(swiftIntArrayVar[1], 5)
        swiftIntArrayVar = []
        XCTAssertEqual(swiftIntArrayVar, Array<Int>())
        swiftIntArrayVar.append(99)
        XCTAssertEqual(swiftIntArrayVar, [99])
    }

    func testSets() {
        XCTAssertEqual(swiftStringSetVar, Set(["a", "b", "c"]))
        XCTAssertEqual(swiftStringSetVar.count, 3)
        XCTAssertTrue(swiftStringSetVar.contains("b"))
        XCTAssertFalse(swiftStringSetVar.contains("d"))
        swiftStringSetVar = ["d", "e", "f", "g"]
        XCTAssertEqual(swiftStringSetVar, ["d", "e", "f", "g"])
        swiftStringSetVar = []
        XCTAssertEqual(swiftStringSetVar, Set<String>())
        swiftStringSetVar.insert("x")
        XCTAssertEqual(swiftStringSetVar, Set(["x"]))
    }

    func testDictionaries() {
        XCTAssertEqual(swiftIntStringDictionaryVar, [1: "a", 2: "b", 3: "c"])
        XCTAssertEqual(swiftIntStringDictionaryVar[2], "b")
        swiftIntStringDictionaryVar = [4: "d", 5: "e", 6: "f"]
        XCTAssertEqual(swiftIntStringDictionaryVar, [4: "d", 5: "e", 6: "f"])
        XCTAssertEqual(swiftIntStringDictionaryVar[5], "e")
        swiftIntStringDictionaryVar = [:]
        XCTAssertEqual(swiftIntStringDictionaryVar, Dictionary<Int, String>())
    }

    func testTuples() {
        XCTAssertEqual(swiftIntStringTuple.0, 1)
        XCTAssertEqual(swiftIntStringTuple.1, "s")
        swiftIntStringTuple = (2, "a")
        XCTAssertEqual(swiftIntStringTuple.0, 2)
        XCTAssertEqual(swiftIntStringTuple.1, "a")
    }

    func testResults() {
        swiftIntErrorResult = .success(99)
        switch swiftIntErrorResult {
        case .success(let ret):
            XCTAssertEqual(ret, 99)
        case .failure:
            XCTFail("Expected success")
        }

        swiftIntErrorResult = .failure(SwiftError())
        switch swiftIntErrorResult {
        case .success:
            XCTFail("Expected failure")
        case .failure:
            // Expected
            break
        }
    }

    func testSwiftHashable() {
        XCTAssertEqual(swiftHashable1, swiftHashable2)
        XCTAssertEqual(swiftHashable1.hashValue, swiftHashable2.hashValue)

        XCTAssertNotEqual(swiftHashable1, swiftHashable3)
        XCTAssertNotEqual(swiftHashable1.hashValue, swiftHashable3.hashValue)

    }

    func testThrowingFunctions() throws {
        do {
            try swiftThrowingVoidFunction(shouldThrow: true)
            XCTFail("Should have thrown")
        } catch {
        }
        XCTAssertEqual(try swiftThrowingFunction(shouldThrow: false), 1)
    }

    public func testThrowingBridgedErrorFunction() {
        do {
            try swiftThrowingBridgedErrorFunction(shouldThrow: false)
        } catch {
            XCTFail("Should have thrown")
        }
        do {
            try swiftThrowingBridgedErrorFunction(shouldThrow: true)
            XCTFail()
        } catch is SwiftError {
            // Expected
        } catch {
            XCTFail("Wrong error type: \(error)")
        }
    }

    public func testThrowingBridgedEnumErrorFunction() {
        do {
            try swiftThrowingBridgedEnumErrorFunction(throw: nil)
        } catch {
            XCTFail("Should have thrown")
        }
        do {
            try swiftThrowingBridgedEnumErrorFunction(throw: 99)
            XCTFail()
        } catch SwiftEnumError.intError(let i) {
            XCTAssertEqual(i, 99)
        } catch {
            XCTFail("Wrong error type: \(error)")
        }
    }

    func testUnsignedParametersFunction() {
        XCTAssertEqual(swiftUnsignedParametersFunction(p0: UInt(3_000_000_000), p1: nil), UInt(3_000_000_000))
    }

    func testAsyncThrowsVar() async throws {
        let value = try await swiftAsyncThrowsVar
        XCTAssertEqual(value, 1)
    }

    func testAsyncFunction() async {
        await swiftAsync0Function()
        
        let result = await swiftAsync1Function(i: 99)
        XCTAssertEqual(result, 100)
    }

    func testAsyncThrowsFunctions() async throws {
        do {
            try await swiftAsyncThrowingVoidFunction(shouldThrow: true)
            XCTFail("Should have thrown")
        } catch {
        }
        let result = try await swiftAsyncThrowingFunction(shouldThrow: false)
        XCTAssertEqual(result, 1)
    }

    func testAsyncStream() async {
        let stream = swiftMakeAsyncStream()
        let content = [100, 200]
        var i = 0
        for await value in stream {
            if i < content.count {
                XCTAssertEqual(value, content[i])
            }
            i += 1
        }
        XCTAssertEqual(i, content.count)

        let roundtripped = swiftRoundtripAsyncStream(stream)
        for await _ in roundtripped {
            XCTFail("Stream should now be empty")
        }
    }

    func testAsyncThrowingStream() async throws {
        let stream = swiftMakeAsyncThrowingStream(throwing: false)
        let content = ["100", "200"]
        var i = 0
        for try await value in stream {
            if i < content.count {
                XCTAssertEqual(value, content[i])
            }
            i += 1
        }
        XCTAssertEqual(i, content.count)

        let roundtripped = swiftRoundtripAsyncThrowingStream(stream)
        for try await _ in roundtripped {
            XCTFail("Stream should now be empty")
        }

        let throwingStream = swiftMakeAsyncThrowingStream(throwing: true)
        i = 0
        do {
            for try await value in throwingStream {
                if i < content.count {
                    XCTAssertEqual(value, content[i])
                }
                i += 1
            }
            XCTFail("Expected to throw on finish")
        } catch {
            // Expected
        }
        XCTAssertEqual(i, content.count)
    }

    func testURL() {
        let url = URL(string: "https://skip.dev")!
        XCTAssertEqual(url.absoluteString, swiftMakeURL(matching: url)?.absoluteString)
    }

    func testUUID() {
        let uuid = UUID()
        XCTAssertEqual(uuid.uuidString, swiftMakeUUID(matching: uuid)?.uuidString)
    }

    func testData() {
        let data = "testdata".data(using: .utf8)!
        let roundtripped = swiftMakeData(matching: data)
        XCTAssertEqual(String(data: data, encoding: .utf8), String(data: roundtripped, encoding: .utf8))
    }

    func testDate() {
        let date = Date()
        XCTAssertEqual(date, swiftMakeDate(matching: date))
    }

    func testLocale() {
        let locale = Locale.current
        XCTAssertEqual(locale.identifier, swiftMakeLocale(matching: locale).identifier)
    }

    func testUnicode() {
        XCTAssertEqual("😀", swiftUTF8StringVar1)
        XCTAssertEqual("🚀123456", swiftUTF8StringVar2)
        XCTAssertEqual("😀🚀", swiftUTF8StringVar3)

        #if !SKIP
        let codePoints: [UInt8] = Array(swiftUTF8StringVar3.utf8)
        #else
        let codePoints: [UInt8] = Array(swiftUTF8StringVar3.toByteArray(Charsets.UTF_8).toList().map({ UByte($0) }))
        #endif
        XCTAssertEqual([240, 159, 152, 128, 240, 159, 154, 128], codePoints.map({ Int($0) }))

        #if SKIP && false
        // when we just use NewStringUTF, this is how strings fail
        XCTAssertNotEqual("😀🚀", swiftUTF8StringVar3)
        XCTAssertEqual([240, 159], codePoints)
        #endif
    }

    func testGlobalFunction() {
        XCTAssertEqual(8, multiplyInt32s(i1: 2, i2: 4))
    }

    #if SKIP
    func testDynamicJavaObjectProperties() throws {
        XCTAssertTrue(try testSupport_dynamicJavaObjectProperties())
    }

    func testDynamicJavaObjectFunctions() throws {
        XCTAssertTrue(try testSupport_dynamicJavaObjectFunctions())
    }

    func testDynamicJavaObjectTraversal() throws {
        XCTAssertTrue(try testSupport_dynamicJavaObjectTraversal())
    }

    func testDynamicKotlinObjects() throws {
        XCTAssertTrue(try testSupport_dynamicKotlinObjects())
    }

    func testDynamicConverting() throws {
        XCTAssertTrue(try testSupport_dynamicConverting())
    }

    func testDynamicStatics() throws {
        XCTAssertTrue(try testSupport_dynamicStatics())
    }

    func testDynamicCodeGen() throws {
        XCTAssertNotEqual(try testSupport_dynamicCodeGenJavaDateTime(), Int64(0))
        XCTAssertNotEqual(try testSupport_dynamicCodeGenSkipDateTime(), 0.0)
    }
    #endif
}

class SwiftAsyncProtocolImpl : SwiftAsyncProtocol {
    var intValue: Int {
        get async {
            return 99
        }
    }
    func stringValue() async throws -> String {
        return "string"
    }
}
