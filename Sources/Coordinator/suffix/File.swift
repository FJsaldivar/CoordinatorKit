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
