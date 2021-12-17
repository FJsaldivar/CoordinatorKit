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
    var navigationCenter: NavigationCenterType! { get set }
    mutating func start(route: Routeable, defaultView: UIViewController) async throws
}

public extension Coordinator {
    
    mutating func start(route: Routeable, defaultView: UIViewController) async throws {
        do {
            self.navigationCenter = NavigationCenter()
            self.navigationCenter.setCoordinator(coordintarot: self)
            let view = try await getFeature(route: route).build(navigationCenter: navigationCenter)
            await navigationCenter.createRootNavigationController(navigation: .init(rootViewController: view))
        } catch let error {
            await navigationCenter.createRootNavigationController(navigation: .init(rootViewController: defaultView))
            throw error
        }
        
    }
    
    func getFeature(route: Routeable) async throws -> Feature.Type {
        let moduleName = type(of: route).module
        guard let moduleType =  modules.first(where: { $0.route == moduleName })?.typeOf else {
            throw CoordinatorError(message: "Not register \(moduleName) in \(type(of: self)) stack")
        }
        let module = try await moduleType.build()
        
        return try await module.getFeature(route: route)

    }
}

public enum RootType {
    case navigation
    case tabNavigation
}
