//
//  File.swift
//  
//
//  Created by Francisco Javier Saldivar Rubio on 18/01/22.
//

import Foundation

infix operator ==

public func ==(left: Linkable, right: Linkable) -> Bool {
    return left.value == right.value
}

infix operator <-

public func <- <T>(left: inout T,
                   value: Dependenciable) throws  {
    guard let dependency = value as? T else {
        throw CoordinatorError(message: " param \(value.self) but required \(T.self)" )
    }

    left = dependency
}

public func map<T>(value: Dependenciable) throws -> T {
    guard let dependency = value as? T else {
        throw CoordinatorError(message: "")
    }
    return dependency
}
