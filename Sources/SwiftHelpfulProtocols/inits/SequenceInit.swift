//
//  SequenceInit.swift
//  HelpfulInits
//
//  Created by Tyler Anger on 2022-03-02.
//

import Foundation
import Dispatch

/// Protocol defining an object that can be initialized with a sequence of InitElement
public protocol SequenceInit {
    associatedtype SequenceInitElement
    /// Creates a new instance of the object containing the elements of a sequence.
    init<S>(_ s: S) where S : Sequence, Self.SequenceInitElement == S.Element
}

// MARK: - Implementations
// MARK: Objects
extension Array: SequenceInit {
    public typealias SequenceInitElement = Element
}
extension Data: SequenceInit {
    public typealias SequenceInitElement = Element
}
extension DispatchData: SequenceInit {
    public typealias SequenceInitElement = Element
    
    public init<S>(_ s: S) where S : Sequence, SequenceInitElement == S.Element {
        if let d = s as? DispatchData {
            var val = DispatchData.empty
            val.append(d)
            self = val
        } else {
            var val = DispatchData.empty
            let data: Data = (s as? Data) ?? Data(s)
            if data.count > 0 {
                #if swift(>=5.0)
                data.withUnsafeBytes {
                    (urbp: UnsafeRawBufferPointer) -> Void in
                    
                    val.append(urbp)
                }
                #else
                data.withUnsafeBytes {
                    (ptr: UnsafePointer<UInt8>) -> Void in
                    
                    let ubp = UnsafeBufferPointer(start: ptr, count: data.count)
                    let urbp = UnsafeRawBufferPointer(ubp)
                    val.append(urbp)
                }
                #endif
            }
            self = val
        }
        
    }
}
