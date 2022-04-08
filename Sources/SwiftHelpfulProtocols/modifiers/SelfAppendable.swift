//
//  SelfAppendable.swift
//  HelpfulProtocols
//
//  Created by Tyler Anger on 2022-03-02.
//

import Foundation
import Dispatch

/// Protocol defining an object that can append another instance of itself
public protocol SelfAppendable {
    /// Appends the content of the specified object to the end of this object.
    mutating func append(_ other: Self)
}

// MARK: - Implementations
// MARK: Objects
extension Data: SelfAppendable { }
extension DispatchData: SelfAppendable { }
