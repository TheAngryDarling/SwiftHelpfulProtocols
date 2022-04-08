//
//  SequenceAppendable.swift
//  HelperProtocols
//
//  Created by Tyler Anger on 2022-03-02.
//

import Foundation
import Dispatch


/// Testing using Array caused 'Exited with signal code 1' on Swift 5.0
/*
 
/// Protocol defining an object that can append a sequence of objects
public protocol SequenceAppendable {
    associatedtype SequenceAppendableElement
    /// Adds the elements of a sequence to the end of the object.
    mutating func append<S>(contentsOf elements: S) where S : Sequence, Self.SequenceAppendableElement == S.Element
}

// MARK: - Implementations
// MARK: Objects
extension Array: SequenceAppendable {
    public typealias SequenceAppendableElement = Element
}
extension Data: SequenceAppendable {
    public typealias SequenceAppendableElement = Element
}
extension DispatchData: SequenceAppendable {
    public typealias SequenceAppendableElement = Element
    
    public mutating func append<S>(contentsOf elements: S) where S : Sequence, SequenceAppendableElement == S.Element {
        let dd = (elements as? DispatchData) ?? DispatchData(elements)
        self.append(dd)
    }
}
*/
