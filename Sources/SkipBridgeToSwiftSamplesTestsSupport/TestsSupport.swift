// Copyright 2024–2026 Skip
// SPDX-License-Identifier: MPL-2.0
import Foundation
import SkipBridgeToSwiftSamples
import SkipBridgeToSwiftSamplesHelpers

// Current limitations on testing require us to go through a compiled wrapper in order to perform our
// tests of bridging to Swift.

public func testSupport_kotlinBoolConstant() -> Bool {
    return kotlinBoolConstant
}

public func testSupport_kotlinDoubleConstant() -> Double {
    return kotlinDoubleConstant
}

public func testSupport_kotlinFloatConstant() -> Float {
    return kotlinFloatConstant
}

public func testSupport_kotlinInt8Constant() -> Int8 {
    return kotlinInt8Constant
}

public func testSupport_kotlinInt16Constant() -> Int16 {
    return kotlinInt16Constant
}

public func testSupport_kotlinInt32Constant() -> Int32 {
    return kotlinInt32Constant
}

public func testSupport_kotlinInt64Constant() -> Int64 {
    return kotlinInt64Constant
}

public func testSupport_kotlinIntConstant() -> Int {
    return kotlinIntConstant
}

public func testSupport_kotlinUnsignedInt8Constant() -> UInt8 {
    return kotlinUnsignedInt8Constant
}

public func testSupport_kotlinUnsignedInt16Constant() -> UInt16 {
    return kotlinUnsignedInt16Constant
}

public func testSupport_kotlinUnsignedInt32Constant() -> UInt32 {
    return kotlinUnsignedInt32Constant
}

public func testSupport_kotlinUnsignedInt64Constant() -> UInt64 {
    return kotlinUnsignedInt64Constant
}

public func testSupport_kotlinUnsignedIntConstant() -> UInt {
    return kotlinUnsignedIntConstant
}

public func testSupport_kotlinStringConstant() -> String {
    return kotlinStringConstant
}

public func testSupport_kotlinClassConstant_stringVar() -> String {
    return kotlinClassConstant.stringVar
}

public func testSupport_kotlinSwiftClassConstant_stringVar() -> String {
    return kotlinSwiftClassConstant.stringVar
}

public func testSupport_kotlinOptionalBoolConstant() -> Bool? {
    return kotlinOptionalBoolConstant
}

public func testSupport_kotlinOptionalDoubleConstant() -> Double? {
    return kotlinOptionalDoubleConstant
}

public func testSupport_kotlinOptionalFloatConstant() -> Float? {
    return kotlinOptionalFloatConstant
}

public func testSupport_kotlinOptionalInt8Constant() -> Int8? {
    return kotlinOptionalInt8Constant
}

public func testSupport_kotlinOptionalInt16Constant() -> Int16? {
    return kotlinOptionalInt16Constant
}

public func testSupport_kotlinOptionalInt32Constant() -> Int32? {
    return kotlinOptionalInt32Constant
}

public func testSupport_kotlinOptionalInt64Constant() -> Int64? {
    return kotlinOptionalInt64Constant
}

public func testSupport_kotlinOptionalIntConstant() -> Int? {
    return kotlinOptionalIntConstant
}

public func testSupport_kotlinOptionalStringConstant() -> String? {
    return kotlinOptionalStringConstant
}

public func testSupport_kotlinOptionalUnsignedInt8Constant() -> UInt8? {
    return kotlinOptionalUnsignedInt8Constant
}

public func testSupport_kotlinOptionalUnsignedInt16Constant() -> UInt16? {
    return kotlinOptionalUnsignedInt16Constant
}

public func testSupport_kotlinOptionalUnsignedInt32Constant() -> UInt32? {
    return kotlinOptionalUnsignedInt32Constant
}

public func testSupport_kotlinOptionalUnsignedInt64Constant() -> UInt64? {
    return kotlinOptionalUnsignedInt64Constant
}

public func testSupport_kotlinOptionalUnsignedIntConstant() -> UInt? {
    return kotlinOptionalUnsignedIntConstant
}

public func testSupport_kotlinBoolVar(value: Bool) -> Bool {
    kotlinBoolVar = value
    return kotlinBoolVar
}

public func testSupport_kotlinDoubleVar(value: Double) -> Double {
    kotlinDoubleVar = value
    return kotlinDoubleVar
}

public func testSupport_kotlinFloatVar(value: Float) -> Float {
    kotlinFloatVar = value
    return kotlinFloatVar
}

public func testSupport_kotlinInt8Var(value: Int8) -> Int8 {
    kotlinInt8Var = value
    return kotlinInt8Var
}

public func testSupport_kotlinInt16Var(value: Int16) -> Int16 {
    kotlinInt16Var = value
    return kotlinInt16Var
}

public func testSupport_kotlinInt32Var(value: Int32) -> Int32 {
    kotlinInt32Var = value
    return kotlinInt32Var
}

public func testSupport_kotlinInt64Var(value: Int64) -> Int64 {
    kotlinInt64Var = value
    return kotlinInt64Var
}

public func testSupport_kotlinIntVar(value: Int) -> Int {
    kotlinIntVar = value
    return kotlinIntVar
}

public func testSupport_kotlinStringVar(value: String) -> String {
    kotlinStringVar = value
    return kotlinStringVar
}

public func testSupport_kotlinNSNumberVar(value: NSNumber) -> NSNumber {
    kotlinNSNumberVar = value
    return kotlinNSNumberVar
}

public func testSupport_kotlinUnsignedInt8Var(value: UInt8) -> UInt8 {
    kotlinUnsignedInt8Var = value
    return kotlinUnsignedInt8Var
}

public func testSupport_kotlinUnsignedInt16Var(value: UInt16) -> UInt16 {
    kotlinUnsignedInt16Var = value
    return kotlinUnsignedInt16Var
}

public func testSupport_kotlinUnsignedInt32Var(value: UInt32) -> UInt32 {
    kotlinUnsignedInt32Var = value
    return kotlinUnsignedInt32Var
}

public func testSupport_kotlinUnsignedInt64Var(value: UInt64) -> UInt64 {
    kotlinUnsignedInt64Var = value
    return kotlinUnsignedInt64Var
}

public func testSupport_kotlinUnsignedIntVar(value: UInt) -> UInt {
    kotlinUnsignedIntVar = value
    return kotlinUnsignedIntVar
}

public func testSupport_kotlinClassVar_stringVar(value: String) -> String {
    let helper = KotlinHelperClass()
    helper.stringVar = value
    kotlinClassVar = helper
    return kotlinClassVar.stringVar
}

public func testSupport_kotlinInnerClassVar_intVar(value: Int) -> Int {
    let inner = KotlinHelperClass.Inner()
    inner.intVar = value
    kotlinInnerClassVar = inner
    return kotlinInnerClassVar.intVar
}

public func testSupport_kotlinSwiftClassVar_stringVar(value: String) -> String {
    let helper = SwiftHelperClass()
    helper.stringVar = value
    kotlinSwiftClassVar = helper
    return kotlinSwiftClassVar.stringVar
}

public func testSupport_kotlinAnyVar(value: Any) -> Any {
    kotlinAnyVar = value
    return kotlinAnyVar
}

public func testSupport_kotlinAnyVar_kotlinClass(value: String) -> String? {
    let helper = KotlinHelperClass()
    helper.stringVar = value
    kotlinAnyVar = helper
    return (kotlinAnyVar as? KotlinHelperClass)?.stringVar
}

public func testSupport_kotlinAnyHashableVar(value: AnyHashable) -> AnyHashable {
    kotlinAnyHashableVar = value
    return kotlinAnyHashableVar
}

public func testSupport_kotlinAnyHashableVar_kotlinClass(value: String) -> String? {
    let helper = KotlinHelperClass()
    helper.stringVar = value
    kotlinAnyHashableVar = helper
    return (kotlinAnyHashableVar as? KotlinHelperClass)?.stringVar
}

public func testSupport_kotlinOptionalBoolVar(value: Bool?) -> Bool? {
    kotlinOptionalBoolVar = value
    return kotlinOptionalBoolVar
}

public func testSupport_kotlinOptionalDoubleVar(value: Double?) -> Double? {
    kotlinOptionalDoubleVar = value
    return kotlinOptionalDoubleVar
}

public func testSupport_kotlinOptionalFloatVar(value: Float?) -> Float? {
    kotlinOptionalFloatVar = value
    return kotlinOptionalFloatVar
}

public func testSupport_kotlinOptionalInt8Var(value: Int8?) -> Int8? {
    kotlinOptionalInt8Var = value
    return kotlinOptionalInt8Var
}

public func testSupport_kotlinOptionalInt16Var(value: Int16?) -> Int16? {
    kotlinOptionalInt16Var = value
    return kotlinOptionalInt16Var
}

public func testSupport_kotlinOptionalInt32Var(value: Int32?) -> Int32? {
    kotlinOptionalInt32Var = value
    return kotlinOptionalInt32Var
}

public func testSupport_kotlinOptionalInt64Var(value: Int64?) -> Int64? {
    kotlinOptionalInt64Var = value
    return kotlinOptionalInt64Var
}

public func testSupport_kotlinOptionalIntVar(value: Int?) -> Int? {
    kotlinOptionalIntVar = value
    return kotlinOptionalIntVar
}

public func testSupport_kotlinOptionalUnsignedInt8Var(value: UInt8?) -> UInt8? {
    kotlinOptionalUnsignedInt8Var = value
    return kotlinOptionalUnsignedInt8Var
}

public func testSupport_kotlinOptionalUnsignedInt16Var(value: UInt16?) -> UInt16? {
    kotlinOptionalUnsignedInt16Var = value
    return kotlinOptionalUnsignedInt16Var
}

public func testSupport_kotlinOptionalUnsignedInt32Var(value: UInt32?) -> UInt32? {
    kotlinOptionalUnsignedInt32Var = value
    return kotlinOptionalUnsignedInt32Var
}

public func testSupport_kotlinOptionalUnsignedInt64Var(value: UInt64?) -> UInt64? {
    kotlinOptionalUnsignedInt64Var = value
    return kotlinOptionalUnsignedInt64Var
}

public func testSupport_kotlinOptionalUnsignedIntVar(value: UInt?) -> UInt? {
    kotlinOptionalUnsignedIntVar = value
    return kotlinOptionalUnsignedIntVar
}

public func testSupport_kotlinOptionalStringVar(value: String?) -> String? {
    kotlinOptionalStringVar = value
    return kotlinOptionalStringVar
}

public func testSupport_kotlinOptionalClassVar_stringVar(value: String?) -> String? {
    if let value {
        let helper = KotlinHelperClass()
        helper.stringVar = value
        kotlinOptionalClassVar = helper
    } else {
        kotlinOptionalClassVar = nil
    }
    return kotlinOptionalClassVar?.stringVar
}

public func testSupport_kotlinOptionalSwiftClassVar_stringVar(value: String?) -> String? {
    if let value {
        let helper = SwiftHelperClass()
        helper.stringVar = value
        kotlinOptionalSwiftClassVar = helper
    } else {
        kotlinOptionalSwiftClassVar = nil
    }
    return kotlinOptionalSwiftClassVar?.stringVar
}

public func testSupport_kotlinIntComputedVar(value: Int) -> Int {
    kotlinIntComputedVar = value
    return kotlinIntComputedVar
}

public func testSupport_kotlinClassComputedVar_stringVar(value: String) -> String {
    let helper = KotlinHelperClass()
    helper.stringVar = value
    kotlinClassComputedVar = helper
    return kotlinClassComputedVar.stringVar
}

public func testSupport_kotlinSwiftClassComputedVar_stringVar(value: String) -> String {
    let helper = SwiftHelperClass()
    helper.stringVar = value
    kotlinSwiftClassComputedVar = helper
    return kotlinSwiftClassComputedVar.stringVar
}

public func testSupport_kotlinClassMemberConstant() -> Int {
    let obj = KotlinClass()
    return obj.intConstant
}

public func testSupport_kotlinClassMemberVar(value: Int) -> Int {
    let obj = KotlinClass()
    obj.intVar = value
    return obj.intVar
}

public func testSupport_kotlinClassMemberOptionalVar(value: Int?) -> Int? {
    let obj = KotlinClass()
    obj.optionalIntVar = value
    return obj.optionalIntVar
}

public func testSupport_kotlinClassMemberKotlinClassConstant_stringVar() -> String {
    let obj = KotlinClass()
    return obj.kotlinClassConstant.stringVar
}

public func testSupport_kotlinClassMemberKotlinClassVar_stringVar(value: String) -> String {
    let helper = KotlinHelperClass()
    helper.stringVar = value
    let obj = KotlinClass()
    obj.kotlinClassVar = helper
    return obj.kotlinClassVar.stringVar
}

public func testSupport_kotlinClassMemberStaticConstant() -> Int {
    return KotlinClass.staticIntConstant
}

public func testSupport_kotlinClassMemberStaticVar(value: Int) -> Int {
    KotlinClass.staticIntVar = 99
    return KotlinClass.staticIntVar
}

public func testSupport_kotlinClassMemberStaticFunc(value: String) -> String {
    return KotlinClass.staticFunc(string: value)
}

public func testSupport_kotlinClassEquatable(lhs: String, rhs: String) -> Bool {
    let lhsHelper = KotlinHelperClass()
    lhsHelper.stringVar = lhs
    let rhsHelper = KotlinHelperClass()
    rhsHelper.stringVar = rhs
    return lhsHelper == rhsHelper
}

public func testSupport_kotlinClassHashable(lhs: String, rhs: String) -> Bool {
    let lhsHelper = KotlinHelperClass()
    lhsHelper.stringVar = lhs
    let rhsHelper = KotlinHelperClass()
    rhsHelper.stringVar = rhs
    return lhsHelper.hashValue == rhsHelper.hashValue
}

public func testSupport_kotlinClassComparable(lhs: String, rhs: String) -> Bool {
    let lhsHelper = KotlinHelperClass()
    lhsHelper.stringVar = lhs
    let rhsHelper = KotlinHelperClass()
    rhsHelper.stringVar = rhs
    return lhsHelper < rhsHelper
}

public func testSupport_kotlinSubclass() -> String? {
    let sub = KotlinSubclass(string: "sub")
    sub.intVar = 100
    guard sub.stringVar == "sub" else {
        return "sub.stringVar == 'sub'"
    }
    guard sub.intVar == 100 else {
        return "sub.intVar == 100"
    }

    kotlinBaseClassVar = sub
    kotlinBaseClassVar.intVar = 101

    let sub2 = kotlinBaseClassVar as? KotlinSubclass
    guard let sub2 else {
        return "sub2 != nil"
    }
    guard sub2.stringVar == "sub" else {
        return "sub2.stringVar == 'sub'"
    }
    guard sub2.intVar == 101 else {
        return "sub2.intVar == 101"
    }
    return nil
}

public func testSupport_kotlinProtocolMember() -> String? {
    let obj = KotlinClass()
    obj.optionalKotlinProtocolVar = nil
    guard obj.optionalKotlinProtocolVar == nil else {
        return "obj.optionalKotlinProtocolVar == nil"
    }

    let helper = KotlinHelperClass()
    helper.stringVar = "foo"
    obj.optionalKotlinProtocolVar = helper
    guard obj.optionalKotlinProtocolVar?.stringValue() == "foo" else {
        return "obj.optionalKotlinProtocolVar?.stringValue() == \"foo\""
    }
    guard obj.optionalKotlinProtocolVar is KotlinHelperClass else {
        return "obj.optionalKotlinProtocolVar is KotlinHelperClass"
    }
    guard obj.optionalKotlinProtocolVar?.hashValue == helper.hashValue else {
        return "obj.optionalKotlinProtocolVar?.hashValue == helper.hashValue"
    }
    return nil
}

public func testSupport_kotlinUnsignedProtocolMember() -> String? {
    let helper = KotlinHelperClass()
    return testSupport_kotlinUnsignedProtocolMember(p: helper)
}

private func testSupport_kotlinUnsignedProtocolMember(p: any KotlinUnsignedProtocol) -> String? {
    let result = p.unsignedParameterProtocolFunc(p: UInt(3_000_000_000))
    guard result == UInt(3_000_000_000) else {
        return "3_000_000_000 expected, but got: \(result)"
    }
    return nil
}

public func testSupport_swiftProtocolMember() -> String? {
    let obj = KotlinClass()
    obj.optionalSwiftProtocolVar = nil
    guard obj.optionalSwiftProtocolVar == nil else {
        return "obj.optionalSwiftProtocolVar == nil"
    }

    let helper = SwiftHelperClass()
    helper.stringVar = "foo"
    obj.optionalSwiftProtocolVar = helper
    guard obj.optionalSwiftProtocolVar?.stringValue() == "foo" else {
        return "obj.optionalSwiftProtocolVar?.stringValue() == \"foo\""
    }
    guard obj.optionalSwiftProtocolVar is SwiftHelperClass else {
        return "obj.optionalKotlinProtocolVar is SwiftHelperClass"
    }
    guard obj.optionalSwiftProtocolVar?.hashValue == helper.hashValue else {
        return "obj.optionalSwiftProtocolVar?.hashValue == helper.hashValue"
    }
    return nil
}

public func testSupport_protocolExtension() -> String? {
    let helper = KotlinHelperClass()
    helper.stringVar = "foo"
    guard helper.stringVar == "foo" else {
        return "helper.stringVar == 'foo'"
    }
    guard helper.protocolExtensionVar == 0 else {
        return "helper.protocolExtensionVar == 0"
    }
    return nil
}

public func testSupport_kotlinStruct() -> String? {
    let s1 = KotlinStruct(string: "2")
    guard s1.intVar == 2 else {
        return "s1.intVar == 2"
    }

    var s2 = s1
    guard s1.intVar == 2 else {
        return "s1.intVar == 2"
    }
    s2.intVar = 3
    guard s1.intVar == 2 else {
        return "s1.intVar == 2"
    }
    guard s2.intVar == 3 else {
        return "s2.intVar == 3"
    }

    s2.setIntFunc(4)
    guard s1.intVar == 2 else {
        return "s1.intVar == 2"
    }
    guard s2.intVar == 4 else {
        return "s2.intVar == 4"
    }
    return nil
}

public func testSupport_swiftStructMember() -> String? {
    let obj = KotlinClass()
    var s1 = SwiftStruct(string: "2")
    obj.swiftStructVar = s1

    s1.intVar = 3
    guard s1.intVar == 3 else {
        return "s1.intVar == 3"
    }
    guard obj.swiftStructVar.intVar == 2 else {
        return "obj.swiftStructVar.intVar == 2"
    }

    obj.swiftStructVar.intVar = 99
    var s2 = obj.swiftStructVar
    s2.intVar = 100
    guard s1.intVar == 3 else {
        return "s1.intVar == 3"
    }
    guard s2.intVar == 100 else {
        return "s2.intVar == 100"
    }
    guard obj.swiftStructVar.intVar == 99 else {
        return "obj.swiftStructVar.intVar == 99"
    }
    return nil
}

public func testSupport_kotlinStructMember() -> String? {
    let obj = KotlinClass()
    var s1 = KotlinStruct(string: "2")
    obj.kotlinStructVar = s1

    s1.intVar = 3
    guard s1.intVar == 3 else {
        return "s1.intVar == 3"
    }
    guard obj.kotlinStructVar.intVar == 2 else {
        return "obj.kotlinStructVar.intVar == 2"
    }

    obj.kotlinStructVar.intVar = 99
    var s2 = obj.kotlinStructVar
    s2.intVar = 100
    guard s1.intVar == 3 else {
        return "s1.intVar == 3"
    }
    guard s2.intVar == 100 else {
        return "s2.intVar == 100"
    }
    guard obj.kotlinStructVar.intVar == 99 else {
        return "obj.kotlinStructVar.intVar == 99"
    }
    return nil
}

public func testSupport_kotlinEnum() -> String? {
    let e1: KotlinEnum = .age
    guard !e1.isName() else {
        return "e1.isName() == false"
    }
    guard e1.rawValue == "years" else {
        return "e1.rawValue == 'years'"
    }
    guard e1.intValue == 1 else {
        return "e1.intValue == 1"
    }

    let e2 = KotlinEnum(intValue: 0)
    guard e2 == .name else {
        return "e2 == .name"
    }
    guard e2.isName() else {
        return "e2.isName() == true"
    }
    guard KotlinEnum.allCases.count == 2 else {
        return "KotlinEnum.allCases.count == 2"
    }
    return nil
}

public func testSupport_kotlinAssociatedValuesEnum() -> String? {
    guard KotlinAssociatedValuesEnum.caseNames == "a,b" else {
        return "KotlinAssociatedValuesEnum.caseNames == 'a,b'"
    }

    let a: KotlinAssociatedValuesEnum = .a(i: 99, "s")
    guard a.intValue == 99 else {
        return "a.intValue == 99"
    }
    guard a.stringValue() == "s" else {
        return "a.stringValue() == 's'"
    }

    let b: KotlinAssociatedValuesEnum = .b
    guard b.intValue == nil else {
        return "b.intValue == nil"
    }
    guard b.stringValue() == ".b" else {
        return "b.stringValue() == '.b'"
    }

    switch a {
    case .a(let i, let s):
        guard i == 99 else {
            return "i == 99"
        }
        guard s == "s" else {
            return "s == 's'"
        }
    case .b:
        return ".b"
    }
    return nil
}

public func testSupport_kotlinActor() async -> String? {
    let a = KotlinActor(99)
    guard await a.intVar == 99 else {
        return "a.intVar == 99"
    }

    await a.setIntVar(100)
    guard await a.intVar == 100 else {
        return "a.intVar == 100"
    }
    return nil
}

public func testSupport_genericClass() -> String? {
    let c = KotlinClass()
    let g = c.kotlinGenericClassVar
    guard g.value == 100 else {
        return "g.value == 100"
    }
    guard g.identity(value: 99, 1) == 99 else {
        return "g.identity == 99"
    }

    g.value = 101
    guard g.value == 101 else {
        return "g.value == 101"
    }

    let g2 = KotlinGenericClass(value: 1)
    c.kotlinGenericClassVar = g2
    guard c.kotlinGenericClassVar.value == 1 else {
        return "c.kotlinGenericClassVar.value == 1"
    }
    return nil
}

public func testSupport_genericStruct() -> String? {
    let c = KotlinClass()
    var g = c.kotlinGenericStructVar
    guard g.value == "a" else {
        return "g.value == 'a'"
    }
    guard g.identity(value: "a", 1) == "a" else {
        return "g.identity == 'a'"
    }

    g.value = "b"
    guard g.value == "b" else {
        return "g.value == 'b'"
    }
    guard c.kotlinGenericStructVar.value == "a" else {
        return "c.kotlinGenericStructVar.value == 'a'"
    }

    c.kotlinGenericStructVar.value = "c"
    guard g.value == "b" else {
        return "g.value == 'b'"
    }
    guard c.kotlinGenericStructVar.value == "c" else {
        return "c.kotlinGenericStructVar.value == 'c'"
    }

    c.kotlinGenericStructVar.update(value: "d")
    guard c.kotlinGenericStructVar.value == "d" else {
        return "c.kotlinGenericStructVar.value == 'd'"
    }

    let g2 = KotlinGenericStruct(value: "z")
    c.kotlinGenericStructVar = g2
    guard c.kotlinGenericStructVar.value == "z" else {
        return "c.kotlinGenericStructVar.value == 'z'"
    }
    return nil
}

public func testSupport_genericEnum() -> String? {
    let c = KotlinClass()
    switch c.kotlinGenericEnumVar {
    case .a(let value, let s):
        guard value == 9 else {
            return "value == 9"
        }
        guard s == "a" else {
            return "s == 'a'"
        }
    case .b:
        return "Expected .b"
    }

    guard c.kotlinGenericEnumVar.value == 9 else {
        return "c.kotlinGenericEnumVar.value == 9"
    }
    guard c.kotlinGenericEnumVar.stringValue() == "a" else {
        return "c.kotlinGenericEnumVar.stringValue() == 'a'"
    }

    c.kotlinGenericEnumVar = .a(10, s: "b")
    switch c.kotlinGenericEnumVar {
    case .a(let value, let s):
        guard value == 10 else {
            return "value == 10"
        }
        guard s == "b" else {
            return "s == 'b'"
        }
    case .b:
        return "Expected .b"
    }

    c.kotlinGenericEnumVar = .b
    let e = c.kotlinGenericEnumVar
    switch e {
    case .a:
        return "Expected .b"
    case .b:
        break
    }
    guard e.value == nil else {
        return "e.value == nil"
    }
    guard e.stringValue() == ".b" else {
        return "e.stringValue() == '.b'"
    }
    return nil
}

public func testSupport_kotlinClosure0Var() {
    kotlinClosure0Var()
    kotlinClosure0Var = { print("reassigned") }
    kotlinClosure0Var()
}

public func testSupport_kotlinClosure0ProtocolVar() -> String {
    let first = kotlinClosure0ProtocolVar().stringValue()

    kotlinClosure0ProtocolVar = {
        let helper = KotlinHelperClass()
        helper.stringVar = "updated"
        return helper
    }

    let second = kotlinClosure0ProtocolVar().stringValue()
    return "\(first)/\(second)"
}

public func testSupport_kotlinClosure1Var(value: Int) -> String {
    let s1 = kotlinClosure1Var(value)
    kotlinClosure1Var = { i in "value = \(i)" }
    let s2 = kotlinClosure1Var(value)
    return s1 == s2 ? s1 : s1 + "/" + s2
}

public func testSupport_kotlinClosure1PrimitivesVar(value: Int64) -> Int {
    let i1 = kotlinClosure1PrimitivesVar(value)
    kotlinClosure1PrimitivesVar = { l in Int(l / 1000) }
    let i2 = kotlinClosure1PrimitivesVar(value)
    return i1 == i2 ? i1 : i1 * 10000 + i2
}

public func testSupport_kotlinClosure1OptionalsVar(value: String?) -> Int? {
    let i1 = kotlinClosure1OptionalsVar(value)
    kotlinClosure1OptionalsVar = { s in s?.count }
    let i2 = kotlinClosure1OptionalsVar(value)
    return i1 == i2 ? i1 : (i1 ?? 0) * 10000 + (i2 ?? 0)
}

public func testSupport_kotlinAsyncClosure0Var() async {
    await kotlinAsyncClosure0Var()
    kotlinAsyncClosure0Var = { try! await Task.sleep(nanoseconds: 1000000); print("reassigned") }
    await kotlinAsyncClosure0Var()
}

public func testSupport_kotlinAsyncClosure0ProtocolVar() async -> String {
    let first = await kotlinAsyncClosure0ProtocolVar().stringValue()

    kotlinAsyncClosure0ProtocolVar = {
        let helper = KotlinHelperClass()
        helper.stringVar = "updated"
        return helper
    }

    let second = await kotlinAsyncClosure0ProtocolVar().stringValue()
    return "\(first)/\(second)"
}

public func testSupport_kotlinAsyncClosure1Var(value: Int) async -> String {
    let s1 = await kotlinAsyncClosure1Var(value)
    kotlinAsyncClosure1Var = { i in "value = \(i)" }
    let s2 = await kotlinAsyncClosure1Var(value)
    return s1 == s2 ? s1 : s1 + "/" + s2
}

public func testSupport_kotlinAsyncClosure1PrimitivesVar(value: Int64) async -> Int {
    let i1 = await kotlinAsyncClosure1PrimitivesVar(value)
    kotlinAsyncClosure1PrimitivesVar = { l in Int(l / 1000) }
    let i2 = await kotlinAsyncClosure1PrimitivesVar(value)
    return i1 == i2 ? i1 : i1 * 10000 + i2
}

public func testSupport_kotlinAsyncClosure1OptionalsVar(value: String?) async -> Int? {
    let i1 = await kotlinAsyncClosure1OptionalsVar(value)
    kotlinAsyncClosure1OptionalsVar = { s in s?.count }
    let i2 = await kotlinAsyncClosure1OptionalsVar(value)
    return i1 == i2 ? i1 : (i1 ?? 0) * 10000 + (i2 ?? 0)
}

public func testSupport_kotlinClosure1Parameter(value: (Int) -> String) {
    // We're only testing that using a closure as a parameter compiles cleanly
}

public func testSupport_kotlinIntArrayVar(value: [Int]) -> [Int] {
    kotlinIntArrayVar = value
    return kotlinIntArrayVar
}

public func testSupport_kotlinStringSetVar(value: Set<String>) -> Set<String> {
    kotlinStringSetVar = value
    return kotlinStringSetVar
}

public func testSupport_kotlinIntStringDictionaryVar(value: [Int: String]) -> [Int: String] {
    kotlinIntStringDictionaryVar = value
    return kotlinIntStringDictionaryVar
}

public func testSupport_kotlinIntStringTupleVar(value: (Int, String)) -> (Int, String) {
    kotlinIntStringTupleVar = value
    return kotlinIntStringTupleVar
}

public func testSupport_kotlinIntErrorResultVar(value: Int?) -> Int? {
    if let value {
        kotlinIntErrorResult = .success(value)
    } else {
        kotlinIntErrorResult = .failure(KotlinError())
    }
    switch kotlinIntErrorResult {
    case .success(let ret):
        return ret
    case .failure:
        return nil
    }
}

public func testSupport_callKotlinThrowingFunction(shouldThrow: Bool) throws -> Int {
    return try kotlinThrowingFunction(shouldThrow: shouldThrow)
}

public func testSupport_callKotlinThrowingVoidFunction(shouldThrow: Bool) throws {
    try kotlinThrowingVoidFunction(shouldThrow: shouldThrow)
}

public func testSupport_callKotlinThrowingBridgedErrorFunction() -> Bool {
    do {
        try kotlinThrowingBridgedErrorFunction(shouldThrow: false)
    } catch {
        return false
    }
    do {
        try kotlinThrowingBridgedErrorFunction(shouldThrow: true)
        return false
    } catch is KotlinError {
        return true
    } catch {
        return false
    }
}

public func testSupport_callKotlinThrowingBridgedEnumErrorFunction() -> Bool {
    do {
        try kotlinThrowingBridgedEnumErrorFunction(throw: nil)
    } catch {
        return false
    }
    do {
        try kotlinThrowingBridgedEnumErrorFunction(throw: 99)
        return false
    } catch KotlinEnumError.intError(let i) {
        return i == 99
    } catch {
        return false
    }
}

public func testSupport_callKotlinUnsignedParametersFunction(with value: UInt) -> UInt {
    return kotlinUnsignedParametersFunction(p0: value, p1: nil)
}

public func testSupport_kotlinAsyncThrowsVar() async throws -> Int {
    return try await kotlinAsyncThrowsVar
}

public func testSupport_callKotlinAsync0Function() async {
    await kotlinAsync0Function()
}

public func testSupport_callKotlinAsync1Function(with value: Int) async -> Int {
    return await kotlinAsync1Function(i: value)
}

public func testSupport_callKotlinAsyncThrowingFunction(shouldThrow: Bool) async throws -> Int {
    return try await kotlinAsyncThrowingFunction(shouldThrow: shouldThrow)
}

public func testSupport_callKotlinAsyncThrowingVoidFunction(shouldThrow: Bool) async throws {
    try await kotlinAsyncThrowingVoidFunction(shouldThrow: shouldThrow)
}

public func testSupport_kotlinAsyncStream(content: [Int]) async -> Bool {
    let stream = kotlinMakeAsyncStream()
    var i = 0
    for await value in stream {
        if i < content.count {
            guard value == content[i] else {
                return false
            }
        }
        i += 1
    }
    guard i == content.count else {
        return false
    }

    let roundtripped = kotlinRoundtripAsyncStream(stream)
    for await _ in roundtripped {
        return false // Should be empty
    }
    return true
}

public func testSupport_kotlinAsyncThrowingStream(content: [String], throwing: Bool) async -> String? {
    let stream = kotlinMakeAsyncThrowingStream(throwing: throwing)
    var i = 0
    do {
        for try await value in stream {
            if i < content.count {
                guard value == content[i] else {
                    return "\(value) == \(content[i])"
                }
            }
            i += 1
        }
        if throwing {
            return "Did not throw at end" // Should have thrown at end
        }
    } catch {
        if !throwing {
            return "Should not have thrown"
        }
    }
    guard i == content.count else {
        return "Did not iterate content: \(i)"
    }

    let roundtripped = kotlinRoundtripAsyncThrowingStream(stream)
    do {
        for try await _ in roundtripped {
            return "Was not empty" // Should be empty
        }
    } catch {
        if !throwing {
            return "Threw on empty: \(error)"
        }
    }
    return nil
}

public func testSupport_kotlinMakeURL(string: String) -> String {
    let url = kotlinMakeURL(matching: URL(string: string)!)
    return url!.absoluteString
}

public func testSupport_kotlinMakeUUID(string: String) -> String {
    let uuid = kotlinMakeUUID(matching: UUID(uuidString: string)!)
    return uuid!.uuidString
}

public func testSupport_kotlinMakeData(string: String) -> String {
    let data = kotlinMakeData(matching: string.data(using: .utf8)!)
    return String(data: data, encoding: .utf8)!
}

public func testSupport_kotlinMakeDate(timeIntervalSinceReferenceDate: Double) -> Double {
    let date = kotlinMakeDate(matching: Date(timeIntervalSinceReferenceDate: timeIntervalSinceReferenceDate))
    return date.timeIntervalSinceReferenceDate
}
