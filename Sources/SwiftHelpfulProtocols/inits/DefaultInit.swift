//
//  DefaultInit.swift
//  HelpfulProtocols
//
//  Created by Tyler Anger on 2022-03-02.
//

import Foundation
import Dispatch

/// Protocol defining an object that can be initialized with no parameters
public protocol DefaultInit {
    init()
}

// MARK: - Implementations
extension Bool: DefaultInit { }
// MARK: Integers
extension Int: DefaultInit { }
extension Int8: DefaultInit { }
extension Int16: DefaultInit { }
extension Int32: DefaultInit { }
extension Int64: DefaultInit { }

extension UInt: DefaultInit { }
extension UInt8: DefaultInit { }
extension UInt16: DefaultInit { }
extension UInt32: DefaultInit { }
extension UInt64: DefaultInit { }

// MARK: Floats
extension Float: DefaultInit { }
//extension Float16: DefaultInit { }
extension Float80: DefaultInit { }
extension Double: DefaultInit { }

// MARK: Objects
extension Array: DefaultInit { }
extension Dictionary: DefaultInit { }
extension Data: DefaultInit { }
extension DispatchData: DefaultInit {
    public init() { self = .empty }
}

