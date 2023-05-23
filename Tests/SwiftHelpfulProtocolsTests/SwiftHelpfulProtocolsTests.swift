import XCTest
import Dispatch
#if DEBUG
@testable import SwiftHelpfulProtocols
#else
import SwiftHelpfulProtocols
#endif

final class SwiftHelpfulProtocolsTests: XCTestCase {
    func testDefaultInits() {
        @discardableResult
        func defInit<Obj>(_ type: Obj.Type) -> Obj where Obj: DefaultInit {
            return Obj.init()
        }
        defInit(Bool.self)
        
        defInit(Int.self)
        defInit(Int8.self)
        defInit(Int16.self)
        defInit(Int32.self)
        defInit(Int64.self)
        
        defInit(UInt.self)
        defInit(UInt8.self)
        defInit(UInt16.self)
        defInit(UInt32.self)
        defInit(UInt64.self)
        
        defInit(Float.self)
        //definit(Float16.self)
        #if arch(x86_64)
        defInit(Float80.self)
        #endif
        defInit(Double.self)
        
        defInit(Array<String>.self)
        defInit(Dictionary<String, String>.self)
        defInit(Data.self)
        defInit(DispatchData.self)
    }
    
    func testSquenceInits() {
        @discardableResult
        func seqInit<Obj>(_ type: Obj.Type, with elements: Obj.SequenceInitElement...) -> Obj where Obj: SequenceInit {
            return Obj(elements)
        }
        
        seqInit(Array<String>.self, with: "1", "2", "3", "4")
        
        seqInit(Data.self, with: 0, 1, 2, 3, 4)
        
        seqInit(DispatchData.self, with: 0, 1, 2, 3, 4)
        
    }
    /*
     // Removed due to Compiler issues with ElementAppendable and Data
    func testElementAppendable() {
        
        func append<Obj>(_ element: Obj.AppendableElement, to object: inout Obj) where Obj: ElementAppendable {
            object.append(element)
        }
        
        var ary: [String] = ["1", "2", "3", "4"]
        append("5", to: &ary)
        XCTAssertTrue(ary.contains("5"),
                      "Could not find appended String element")
        
        /*var dta: Data = Data([0, 1, 2, 3, 4])
        append(5, to: &dta)
        XCTAssertTrue(dta.contains(5),
                      "Could not find appended Data element")*/
        
        var dispDta: DispatchData = DispatchData([0, 1, 2, 3, 4])
        append(5, to: &dispDta)
        XCTAssertTrue(dispDta.contains(5),
                      "Could not find appended DispatchData element")
    }
    */
    func testSelfAppendable() {
        func append<Obj>(_ element: Obj, to object: inout Obj) where Obj: SelfAppendable {
            object.append(element)
        }
        
        var dta: Data = Data([0, 1, 2, 3, 4])
        append(Data([5]), to: &dta)
        XCTAssertTrue(dta.contains(5),
                      "Could not find appended Data element")
        
        var dispDta: DispatchData = DispatchData([0, 1, 2, 3, 4])
        append(DispatchData([5]), to: &dispDta)
        XCTAssertTrue(dispDta.contains(5),
                      "Could not find appended DispatchData element")
    }
    
    
    /*
    // Testing using Array caused 'Exited with signal code 1' on Swift 5.0
    func testSequenceAppendable() {
        
        func append<S, Obj>(contentsOf elements: S,
                            to object: inout Obj)
        where Obj: SequenceAppendable, S: Sequence,
              Obj.SequenceAppendableElement == S.Element {
            object.append(contentsOf: elements)
        }
        
        //#if !swift(>=5.0) || swift(>=5.1)
        print("Testing String Array")
        var ary: [String] = ["1", "2", "3", "4"]
        append(contentsOf: ["5"], to: &ary)
        XCTAssertTrue(ary.contains("5"),
                      "Could not find appended String element")
        //#endif
        
        var dta: Data = Data([0, 1, 2, 3, 4])
        append(contentsOf: [5], to: &dta)
        XCTAssertTrue(dta.contains(5),
                      "Could not find appended Data element")
        
        var dispDta: DispatchData = DispatchData([0, 1, 2, 3, 4])
        append(contentsOf: [5], to: &dispDta)
        XCTAssertTrue(dispDta.contains(5),
                      "Could not find appended DispatchData element")
        /*
        #if swift(>=5.5)
        print("Swift 5.5+")
        #elseif swift(>=5.4)
        print("Swift 5.4+")
        #elseif swift(>=5.3)
        print("Swift 5.3+")
        #elseif swift(>=5.2)
        print("Swift 5.2+")
        #elseif swift(>=5.1)
        print("Swift 5.1+")
        #elseif swift(>=5.0)
        print("Swift 5.0+")
        #elseif swift(>=4.2)
        print("Swift 4.2+")
        #elseif swift(>=4.1)
        print("Swift 4.1+")
        #elseif swift(>=4.0)
        print("Swift 4.0+")
        #endif
        */
    }
    */
    static var allTests = [
        ("testDefaultInits", testDefaultInits),
        ("testSquenceInits", testSquenceInits),
        //("testElementAppendable", testElementAppendable),
        ("testSelfAppendable", testSelfAppendable),
        //("testSequenceAppendable", testSequenceAppendable)
        
    ]
}
