// Copyright 2024–2026 Skip
// SPDX-License-Identifier: MPL-2.0
import Foundation
import SkipBridge
import SkipBridgeToSwiftSamplesTestsSupport
import XCTest

final class BridgeToSwiftTests: XCTestCase {
    override func setUp() {
        #if SKIP
        loadPeerLibrary(packageName: "skip-bridge", moduleName: "SkipBridgeToSwiftSamplesTestsSupport")
        #endif
    }

    func testSimpleConstants() {
        XCTAssertEqual(testSupport_kotlinBoolConstant(), true)
        XCTAssertEqual(testSupport_kotlinDoubleConstant(), 1.0)
        XCTAssertEqual(testSupport_kotlinFloatConstant(), Float(2.0))
        XCTAssertEqual(testSupport_kotlinInt8Constant(), Int8(3))
        XCTAssertEqual(testSupport_kotlinInt16Constant(), Int16(4))
        XCTAssertEqual(testSupport_kotlinInt32Constant(), Int32(5))
        XCTAssertEqual(testSupport_kotlinInt64Constant(), Int64(6))
        XCTAssertEqual(testSupport_kotlinIntConstant(), 7)
        XCTAssertEqual(testSupport_kotlinStringConstant(), "s")
    }

    func testUnsignedConstants() {
        XCTAssertEqual(testSupport_kotlinUnsignedInt8Constant(), UInt8(200))
        XCTAssertEqual(testSupport_kotlinUnsignedInt16Constant(), UInt16(40_000))
        XCTAssertEqual(testSupport_kotlinUnsignedInt32Constant(), UInt32(3_000_000_000))
        XCTAssertEqual(testSupport_kotlinUnsignedInt64Constant(), UInt64(3_000_000_000))
        XCTAssertEqual(testSupport_kotlinUnsignedIntConstant(), UInt(3_000_000_000))
    }

    func testKotlinClassConstant() {
        XCTAssertEqual(testSupport_kotlinClassConstant_stringVar(), "s")
    }

    func testSwiftClassConstant() {
        XCTAssertEqual(testSupport_kotlinSwiftClassConstant_stringVar(), "s")
    }

    func testOptionalConstants() {
        XCTAssertEqual(testSupport_kotlinOptionalBoolConstant(), true)
        XCTAssertEqual(testSupport_kotlinOptionalDoubleConstant(), 1.0)
        XCTAssertEqual(testSupport_kotlinOptionalFloatConstant(), Float(2.0))
        XCTAssertNil(testSupport_kotlinOptionalInt8Constant())
        XCTAssertEqual(testSupport_kotlinOptionalInt16Constant(), Int16(3))
        XCTAssertEqual(testSupport_kotlinOptionalInt32Constant(), Int32(4))
        XCTAssertEqual(testSupport_kotlinOptionalInt64Constant(), Int64(5))
        XCTAssertEqual(testSupport_kotlinOptionalIntConstant(), 6)
        XCTAssertEqual(testSupport_kotlinOptionalStringConstant(), "s")
    }

    func testUnsignedOptionalConstants() {
        XCTAssertEqual(testSupport_kotlinOptionalUnsignedInt8Constant(), UInt8(200))
        XCTAssertEqual(testSupport_kotlinOptionalUnsignedInt16Constant(), UInt16(40_000))
        XCTAssertEqual(testSupport_kotlinOptionalUnsignedInt32Constant(), UInt32(3_000_000_000))
        XCTAssertEqual(testSupport_kotlinOptionalUnsignedInt64Constant(), UInt64(3_000_000_000))
        XCTAssertEqual(testSupport_kotlinOptionalUnsignedIntConstant(), UInt(3_000_000_000))
    }

    func testSimpleVars() {
        XCTAssertEqual(testSupport_kotlinBoolVar(value: false), false)
        XCTAssertEqual(testSupport_kotlinDoubleVar(value: 101.0), 101.0)
        XCTAssertEqual(testSupport_kotlinFloatVar(value: Float(102.0)), Float(102.0))
        XCTAssertEqual(testSupport_kotlinInt8Var(value: Int8(103)), Int8(103))
        XCTAssertEqual(testSupport_kotlinInt16Var(value: Int16(104)), Int16(104))
        XCTAssertEqual(testSupport_kotlinInt32Var(value: Int32(105)), Int32(105))
        XCTAssertEqual(testSupport_kotlinInt64Var(value: Int64(106)), Int64(106))
        XCTAssertEqual(testSupport_kotlinIntVar(value: 107), 107)
        XCTAssertEqual(testSupport_kotlinStringVar(value: "ss"), "ss")
        XCTAssertEqual(testSupport_kotlinNSNumberVar(value: NSNumber(value: 10.5)), NSNumber(value: 10.5))
    }

    func testUnsignedVars() {
        XCTAssertEqual(testSupport_kotlinUnsignedInt8Var(value: UInt8(201)), UInt8(201))
        XCTAssertEqual(testSupport_kotlinUnsignedInt16Var(value: UInt16(40_001)), UInt16(40_001))
        XCTAssertEqual(testSupport_kotlinUnsignedInt32Var(value: UInt32(3_000_000_001)), UInt32(3_000_000_001))
        XCTAssertEqual(testSupport_kotlinUnsignedInt64Var(value: UInt64(3_000_000_001)), UInt64(3_000_000_001))
        XCTAssertEqual(testSupport_kotlinUnsignedIntVar(value: UInt(3_000_000_001)), UInt(3_000_000_001))
    }

    func testKotlinClassVar() {
        XCTAssertEqual(testSupport_kotlinClassVar_stringVar(value: "ss"), "ss")
    }

    func testKotlinInnerClassVar() {
        XCTAssertEqual(testSupport_kotlinInnerClassVar_intVar(value: 2), 2)
    }

    func testSwiftClassVar() {
        XCTAssertEqual(testSupport_kotlinSwiftClassVar_stringVar(value: "ss"), "ss")
    }

    func testAnyVar() {
        XCTAssertEqual(testSupport_kotlinAnyVar(value: 1) as? Int, 1)
        XCTAssertEqual(testSupport_kotlinAnyVar(value: "a") as? String, "a")
        XCTAssertEqual(testSupport_kotlinAnyVar_kotlinClass(value: "ss"), "ss")
    }

    func testAnyHashableVar() {
        XCTAssertEqual(testSupport_kotlinAnyHashableVar(value: 1) as? Int, 1)
        XCTAssertEqual(testSupport_kotlinAnyHashableVar(value: "a") as? String, "a")
        XCTAssertEqual(testSupport_kotlinAnyHashableVar_kotlinClass(value: "ss"), "ss")
    }

    func testAnyVarContainerValues() {
        let anyArray = testSupport_kotlinAnyVar(value: ["a", 2, 3.0]) as? [Any]
        guard let anyArray else {
            return XCTFail()
        }
        XCTAssertEqual(anyArray[0] as? String, "a")
        XCTAssertEqual(anyArray[1] as? Int, 2)
        XCTAssertEqual(anyArray[2] as? Double, 3.0)

        let anyDictionary = testSupport_kotlinAnyVar(value: ["a": 1, "b": 2]) as? [AnyHashable: Any]
        guard let anyDictionary else {
            return XCTFail()
        }
        XCTAssertEqual(anyDictionary["a"] as? Int, 1)
        XCTAssertEqual(anyDictionary["b"] as? Int, 2)
    }

    func testOptionalSimpleVars() {
        XCTAssertEqual(testSupport_kotlinOptionalBoolVar(value: false), false)
        XCTAssertNil(testSupport_kotlinOptionalBoolVar(value: nil))
        XCTAssertEqual(testSupport_kotlinOptionalDoubleVar(value: 101.0), 101.0)
        XCTAssertNil(testSupport_kotlinOptionalDoubleVar(value: nil))
        XCTAssertEqual(testSupport_kotlinOptionalFloatVar(value: Float(102.0)), Float(102.0))
        XCTAssertNil(testSupport_kotlinOptionalFloatVar(value: nil))
        XCTAssertEqual(testSupport_kotlinOptionalInt8Var(value: Int8(103)), Int8(103))
        XCTAssertNil(testSupport_kotlinOptionalInt8Var(value: nil))
        XCTAssertEqual(testSupport_kotlinOptionalInt16Var(value: Int16(104)), Int16(104))
        XCTAssertNil(testSupport_kotlinOptionalInt16Var(value: nil))
        XCTAssertEqual(testSupport_kotlinOptionalInt32Var(value: Int32(105)), Int32(105))
        XCTAssertNil(testSupport_kotlinOptionalInt32Var(value: nil))
        XCTAssertEqual(testSupport_kotlinOptionalInt64Var(value: Int64(106)), Int64(106))
        XCTAssertNil(testSupport_kotlinOptionalInt64Var(value: nil))
        XCTAssertEqual(testSupport_kotlinOptionalIntVar(value: 107), 107)
        XCTAssertNil(testSupport_kotlinOptionalIntVar(value: nil))
        XCTAssertEqual(testSupport_kotlinOptionalStringVar(value: "ss"), "ss")
        XCTAssertNil(testSupport_kotlinOptionalStringVar(value: nil))
    }

    func testOptionalUnsignedVars() {
        XCTAssertEqual(testSupport_kotlinOptionalUnsignedInt8Var(value: UInt8(201)), UInt8(201))
        XCTAssertNil(testSupport_kotlinOptionalUnsignedInt8Var(value: nil))
        XCTAssertEqual(testSupport_kotlinOptionalUnsignedInt16Var(value: UInt16(40_001)), UInt16(40_001))
        XCTAssertNil(testSupport_kotlinOptionalUnsignedInt16Var(value: nil))
        XCTAssertEqual(testSupport_kotlinOptionalUnsignedInt32Var(value: UInt32(3_000_000_001)), UInt32(3_000_000_001))
        XCTAssertNil(testSupport_kotlinOptionalUnsignedInt32Var(value: nil))
        XCTAssertEqual(testSupport_kotlinOptionalUnsignedInt64Var(value: UInt64(3_000_000_001)), UInt64(3_000_000_001))
        XCTAssertNil(testSupport_kotlinOptionalUnsignedInt64Var(value: nil))
        XCTAssertEqual(testSupport_kotlinOptionalUnsignedIntVar(value: UInt(3_000_000_001)), UInt(3_000_000_001))
        XCTAssertNil(testSupport_kotlinOptionalUnsignedIntVar(value: nil))
    }

    func testOptionalKotlinClassVar() {
        XCTAssertEqual(testSupport_kotlinOptionalClassVar_stringVar(value: "ss"), "ss")
        XCTAssertNil(testSupport_kotlinOptionalClassVar_stringVar(value: nil))
    }

    func testOptionalSwiftClassVar() {
        XCTAssertEqual(testSupport_kotlinOptionalSwiftClassVar_stringVar(value: "ss"), "ss")
        XCTAssertNil(testSupport_kotlinOptionalSwiftClassVar_stringVar(value: nil))
    }

    func testComputedIntVar() {
        XCTAssertEqual(testSupport_kotlinIntComputedVar(value: 99), 99)
    }

    func testComputedSwiftClassVar() {
        XCTAssertEqual(testSupport_kotlinSwiftClassComputedVar_stringVar(value: "computed"), "computed")
    }

    func testComputedKotlinClassVar() {
        XCTAssertEqual(testSupport_kotlinClassComputedVar_stringVar(value: "computed"), "computed")
    }

    func testKotlinClassMemberConstant() {
        XCTAssertEqual(testSupport_kotlinClassMemberConstant(), 1)
    }

    func testKotlinClassMemberVar() {
        XCTAssertEqual(testSupport_kotlinClassMemberVar(value: 99), 99)
    }

    func testKotlinClassMemberOptionalVar() {
        XCTAssertEqual(testSupport_kotlinClassMemberOptionalVar(value: 99), 99)
        XCTAssertNil(testSupport_kotlinClassMemberOptionalVar(value: nil))
    }

    func testKotlinClassMemberKotlinClassConstant() {
        XCTAssertEqual(testSupport_kotlinClassMemberKotlinClassConstant_stringVar(), "s")
    }

    func testKotlinClassMemberKotlinClassVar() {
        XCTAssertEqual(testSupport_kotlinClassMemberKotlinClassVar_stringVar(value: "member"), "member")
    }

    func testKotlinClassMemberStaticConstant() {
        XCTAssertEqual(testSupport_kotlinClassMemberStaticConstant(), 1)
    }

    func testKotlinClassMemberStaticVar() {
        XCTAssertEqual(testSupport_kotlinClassMemberStaticVar(value: 99), 99)
    }

    func testKotlinClassMemberStaticFunc() {
        XCTAssertEqual(testSupport_kotlinClassMemberStaticFunc(value: "Hello"), "kotlinHello")
    }

    func testKotlinClassEquatable() {
        XCTAssertTrue(testSupport_kotlinClassEquatable(lhs: "Hello", rhs: "Hello"))
        XCTAssertFalse(testSupport_kotlinClassEquatable(lhs: "Hello", rhs: "Goodbye"))
    }

    func testKotlinClassHashable() {
        XCTAssertTrue(testSupport_kotlinClassHashable(lhs: "Hello", rhs: "Hello"))
        XCTAssertFalse(testSupport_kotlinClassHashable(lhs: "Hello", rhs: "Goodbye"))
    }

    func testKotlinClassComparable() {
        XCTAssertTrue(testSupport_kotlinClassComparable(lhs: "aaa", rhs: "bbb"))
        XCTAssertFalse(testSupport_kotlinClassComparable(lhs: "bbb", rhs: "aaa"))
    }

    public func testKotlinSubclass() {
        XCTAssertNil(testSupport_kotlinSubclass())
    }

    func testKotlinProtocolMember() {
        XCTAssertNil(testSupport_kotlinProtocolMember())
    }

    func testSwiftProtocolMember() {
        XCTAssertNil(testSupport_swiftProtocolMember())
    }

    func testKotlinUnsignedProtocolMember() {
        XCTAssertNil(testSupport_kotlinUnsignedProtocolMember())
    }

    public func testStruct() {
        XCTAssertNil(testSupport_kotlinStruct())
    }

    public func testProtocolExtension() {
        XCTAssertNil(testSupport_protocolExtension())
    }

    public func testSwiftStructMember() {
        XCTAssertNil(testSupport_swiftStructMember())
    }

    public func testKotlinStructMember() {
        XCTAssertNil(testSupport_kotlinStructMember())
    }

    public func testEnum() {
        XCTAssertNil(testSupport_kotlinEnum())
    }

    public func testAssociatedValuesEnum() {
        XCTAssertNil(testSupport_kotlinAssociatedValuesEnum())
    }

    public func testActor() async {
        let value = await testSupport_kotlinActor()
        XCTAssertNil(value)
    }

    public func testGenericClass() {
        XCTAssertNil(testSupport_genericClass())
    }

    public func testGenericStruct() {
        XCTAssertNil(testSupport_genericStruct())
    }

    public func testGenericEnum() {
        XCTAssertNil(testSupport_genericEnum())
    }

    func testClosure0Var() {
        testSupport_kotlinClosure0Var()
    }

    func testClosure0ProtocolVar() {
        XCTAssertEqual(testSupport_kotlinClosure0ProtocolVar(), "s/updated")
    }

    func testClosure1Var() {
        XCTAssertEqual(testSupport_kotlinClosure1Var(value: 100), "value = 100")
    }

    func testClosure1PrimitivesVar() {
        XCTAssertEqual(testSupport_kotlinClosure1PrimitivesVar(value: Int64(3000)), 3)
    }

    func testClosure1OptionalsVar() {
        XCTAssertEqual(testSupport_kotlinClosure1OptionalsVar(value: "abc"), 3)
        XCTAssertEqual(testSupport_kotlinClosure1OptionalsVar(value: nil), nil)
    }

    func testAsyncClosure0Var() async {
        await testSupport_kotlinAsyncClosure0Var()
    }

    func testAsyncClosure0ProtocolVar() async {
        let result = await testSupport_kotlinAsyncClosure0ProtocolVar()
        XCTAssertEqual(result, "s/updated")
    }

    func testAsyncClosure1Var() async {
        let result = await testSupport_kotlinAsyncClosure1Var(value: 100)
        XCTAssertEqual(result, "value = 100")
    }

    func testAsyncClosure1PrimitivesVar() async {
        let result = await testSupport_kotlinAsyncClosure1PrimitivesVar(value: Int64(3000))
        XCTAssertEqual(result, 3)
    }

    func testAsyncClosure1OptionalsVar() async {
        let result1 = await testSupport_kotlinAsyncClosure1OptionalsVar(value: "abc")
        XCTAssertEqual(result1, 3)
        let result2 = await testSupport_kotlinAsyncClosure1OptionalsVar(value: nil)
        XCTAssertEqual(result2, nil)
    }

    func testArrays() {
        let roundtripped = testSupport_kotlinIntArrayVar(value: [4, 5, 6])
        XCTAssertEqual(roundtripped, [4, 5, 6])
        XCTAssertEqual(roundtripped[1], 5)
    }

    func testSets() {
        let roundtripped = testSupport_kotlinStringSetVar(value: Set(["d", "e", "f"]))
        XCTAssertEqual(roundtripped, Set(["d", "e", "f"]))
        XCTAssertEqual(roundtripped.count, 3)
    }

    func testDictionaries() {
        let roundtripped = testSupport_kotlinIntStringDictionaryVar(value: [4: "d", 5: "e", 6: "f"])
        XCTAssertEqual(roundtripped, [4: "d", 5: "e", 6: "f"])
        XCTAssertEqual(roundtripped[5], "e")
    }

    func testTuples() {
        let roundtripped = testSupport_kotlinIntStringTupleVar(value: (2, "a"))
        XCTAssertEqual(roundtripped.0, 2)
        XCTAssertEqual(roundtripped.1, "a")
    }

    func testResult() {
        let roundtrippedSuccess = testSupport_kotlinIntErrorResultVar(value: 99)
        XCTAssertEqual(roundtrippedSuccess, 99)
        let roundtrippedError = testSupport_kotlinIntErrorResultVar(value: nil)
        XCTAssertNil(roundtrippedError)
    }

    func testThrowingFunctions() throws {
        do {
            try testSupport_callKotlinThrowingVoidFunction(shouldThrow: true)
            XCTFail("Should have thrown")
        } catch {
        }
        XCTAssertEqual(try testSupport_callKotlinThrowingFunction(shouldThrow: false), 1)
    }

    func testThrowingBridgedFunction() {
        XCTAssertTrue(testSupport_callKotlinThrowingBridgedErrorFunction())
    }

    func testThrowingBridgedEnumFunction() {
        XCTAssertTrue(testSupport_callKotlinThrowingBridgedEnumErrorFunction())
    }

    func testUnsignedParametersFunction() {
        XCTAssertEqual(testSupport_callKotlinUnsignedParametersFunction(with: UInt(3_000_000_000)), UInt(3_000_000_000))
    }

    func testAsyncThrowsVar() async throws {
        let value = try await testSupport_kotlinAsyncThrowsVar()
        XCTAssertEqual(value, 1)
    }

    func testAsyncFunctions() async {
        await testSupport_callKotlinAsync0Function()

        let result = await testSupport_callKotlinAsync1Function(with: 99)
        XCTAssertEqual(result, 100)
    }

    func testAsyncThrowsFunctions() async throws {
        do {
            try await testSupport_callKotlinAsyncThrowingVoidFunction(shouldThrow: true)
            XCTFail("Should have thrown")
        } catch {
        }
        let result = try await testSupport_callKotlinAsyncThrowingFunction(shouldThrow: false)
        XCTAssertEqual(result, 1)
    }

    func testAsyncStream() async {
        let result = await testSupport_kotlinAsyncStream(content: [100, 200])
        XCTAssertTrue(result)
    }

    func testAsyncThrowingStream() async {
        let result = await testSupport_kotlinAsyncThrowingStream(content: ["100", "200"], throwing: false)
        XCTAssertNil(result)

        let throwingResult = await testSupport_kotlinAsyncThrowingStream(content: ["100", "200"], throwing: true)
        XCTAssertNil(throwingResult)
    }

    func testURL() {
        let string = "https://skip.dev"
        XCTAssertEqual(string, testSupport_kotlinMakeURL(string: string))
    }

    func testUUID() {
        let string = UUID().uuidString
        XCTAssertEqual(string, testSupport_kotlinMakeUUID(string: string))
    }

    func testData() {
        let string = "datastring"
        XCTAssertEqual(string, testSupport_kotlinMakeData(string: string))
    }

    func testDate() {
        let date = Date()
        XCTAssertEqual(date.timeIntervalSinceReferenceDate, testSupport_kotlinMakeDate(timeIntervalSinceReferenceDate: date.timeIntervalSinceReferenceDate))
    }
}
