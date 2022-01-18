//
//  File.swift
//  
//
//  Created by Francisco Javier Saldivar Rubio on 01/12/21.
//

import UIKit

public protocol Routeable {
    static var module: String { get }

    var dependecy: Dependenciable? { get }
    var link: Linkable { get }
}

public protocol Linkable {
    var value: String { get }
}

extension Linkable {
    static func == (lhs: Linkable, rsh: Linkable) -> Bool {
        return lhs.value == rsh.value
    }
}

public protocol ModuleRouteable {
    var routes: [Feature.Type] { get }
    static var moduleIdentifier: String { get }
    static var typeOf: Modulable.Type { get }
}

public protocol FeatureRouteable {
    static var link: Linkable { get }
    static var typeOf: Feature.Type { get }
}

public protocol Routerable {
    var coordinator: Coordinator { set get }
}

public func run(_ task: @escaping () async throws -> Void, error: @escaping ((Error) -> Void)) {
    
    let error: ((Error) -> Void)? = error
    let task : (() async throws -> Void)? = task
    
    Task {
        do {
            try await task?()
        } catch let taskError {
            error?(taskError)
        }
    }
}
