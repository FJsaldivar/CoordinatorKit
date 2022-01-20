//
//  File.swift
//  
//
//  Created by Francisco Javier Saldivar Rubio on 01/12/21.
//

import Foundation
import UIKit

public protocol Coordinator {
    var modules: [ModuleRouteable.Type] { get }
    var window: UIWindow { get set }
}

public extension Coordinator {

    func getFeature(route: Routeable) async throws -> Feature {
        let moduleName = type(of: route).module
        guard let moduleType =  modules.first(where: { $0.moduleIdentifier == moduleName })?.typeOf else {
            throw CoordinatorError(message: "Not register \(moduleName) in \(type(of: self)) stack")
        }
        let module = try await moduleType.build()
        guard let dependency = route.dependecy else {
            return try await module.getFeature(route: route).init()
        }

        return try await module.getFeature(route: route).init(dependency: dependency)

    }
}
