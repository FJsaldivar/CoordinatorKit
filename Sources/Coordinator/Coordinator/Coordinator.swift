//
//  File.swift
//  
//
//  Created by Francisco Javier Saldivar Rubio on 01/12/21.
//

import Foundation
import UIKit
import XCTest
public protocol Coordinator {
    var modules: [ModuleRouteable.Type] { get }
    var window: UIWindow { get set }
}

public extension Coordinator {
    func getFeature(route: Routeable) async throws -> Feature.Type {
        let moduleName = type(of: route).module
        guard let moduleType =  modules.first(where: { $0.route == moduleName })?.typeOf else {
            throw CoordinatorError(message: "Not register \(moduleName) in \(type(of: self)) stack")
        }
        let module = try await moduleType.build()
        
        return try await module.getFeature(route: route)

    }
}
