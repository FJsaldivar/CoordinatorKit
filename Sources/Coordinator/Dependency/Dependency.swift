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
    var arg: [String: Any] { get set }
    init()
}

public struct Dependency: Dependenciable {
    public var arg: [String : Any] = [:]

    public init() {
    }
}

public extension Dependenciable {

    mutating func put(tag: String, value: Any) {
        self.arg[tag] = value
    }
    
    func get<T>(tag: String) throws -> T {
        if arg.isEmpty {
            throw CoordinatorError.empty
        }
        guard let value = arg[tag] else {
            throw CoordinatorError.notFound(tag: tag)
        }
                
        guard let result = value as? T else {
            throw CoordinatorError.notResolve(type: T.self, element: value)
        }

        return result
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

