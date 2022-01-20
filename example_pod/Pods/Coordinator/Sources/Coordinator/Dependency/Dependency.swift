//
//  File.swift
//  
//
//  Created by Francisco Javier Saldivar Rubio on 01/12/21.
//

import Foundation
import UIKit
import MapKit

public protocol Dependenciable {
 
}

public extension Dependenciable {
    func transform <T: Dependenciable>() throws -> T {
        guard let spected = self as? T else {
            throw CoordinatorError(message: "Error dependency: Spected \(T.self) /= retrive \(self)")
        }
        return spected
    }
}

extension Error {

    static var dependenciesNil: CoordinatorError {
        .init(message: "Not retrive dependencies")
    }
    
    static var empty: CoordinatorError {
        .init(message: "Dependencies error: [empty] -> Empty arguments ")
    }

    static func notFound(tag: String) -> CoordinatorError {
        .init(message: "Dependencies error: [not found] -> Argument [\(tag)] not localized ")
    }
    
    static func notResolve<T, E>(type: T.Type, element: E) -> CoordinatorError {
        let typeElement = Swift.type(of: element)
        let strElement = String(describing: typeElement)
        
        return .init(message: "Dependencies error: [not resolve] type[\(String(describing: type))] not is equals to" +
                     " type[\(strElement)] -> \(element)")
    }

}

