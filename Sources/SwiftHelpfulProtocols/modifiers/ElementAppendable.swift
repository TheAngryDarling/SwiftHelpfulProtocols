//
//  ElementAppendable.swift
//  HelpfulProtocols
//
//  Created by Tyler Anger on 2022-03-02.
//

import Foundation
import Dispatch

/// Swift compiler has an issue of Data implementing ElementAppendable
/// even though it already had the function implemented
/*
/// Protocol defining an object that can append an element
public protocol ElementAppendable {
    associatedtype AppendableElement
    /// Adds a new element at the end of the object.
    mutating func append(_ newElement: AppendableElement)
}

/// Swift compiler has an issue with this extension
//public extension ElementAppendable where Self: Sequence {
//    typealias AppendableElement = Element
//}

// MARK: - Implementations
// MARK: Objects
extension Array: ElementAppendable {
    public typealias AppendableElement = Element
}

extension Data: ElementAppendable {
    public typealias AppendableElement = Element
}

extension DispatchData: ElementAppendable {
    public typealias AppendableElement = Element
    
    public mutating func append(_ newElement: UInt8) {
        var newElement = newElement
        withUnsafePointer(to: &newElement) {
            (ptr: UnsafePointer<AppendableElement>) -> Void in
            let rawPtr = UnsafeRawBufferPointer(start: ptr, count: 1)
            self.append(rawPtr)
        }
    }
}
*/
