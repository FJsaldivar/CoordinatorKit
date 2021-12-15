//
//  File.swift
//  
//
//  Created by Francisco Javier Saldivar Rubio on 01/12/21.
//

import Foundation
import UIKit
public protocol Coordinator {
    var routes: [Routeable.Type] { get }
    var window: UIWindow { get set }

    func initRootNavigationController(route: String, dependency: Dependenciable?) throws
    
    func createRootNav(viewController: UIViewController) -> NavigationCenterType
}

public extension Coordinator {
    
    func filterRoute(route: String) throws -> Routeable.Type {

        guard let routeModule = routes.first(where: { $0.route == route}) else {
            throw CoordinatorError(message: "routes not contains route \(route)")
        }
        return routeModule
    }

    func createRootNav(viewController: UIViewController) -> NavigationCenterType {
        let navigationController: UINavigationController = .init(rootViewController: viewController)
        return NavigationCenter(navigation: Navigation(cordinator: self, navigation: navigationController), tabNavigation: nil)
    }
    
    fileprivate func createRouter(_ dependency: Dependenciable?,
                                  _ routeModule: Routeable.Type) throws -> Routerable {
        if let dependency = dependency {
            return try routeModule.typeOf.build(dependency: dependency)
        }
        return try routeModule.typeOf.build()
    }
    
    func initRootNavigationController(route: String, dependency: Dependenciable? = nil) throws {
        let routeModule: Routeable.Type = try filterRoute(route: route)
        let router: Routerable = try createRouter(dependency, routeModule)
        let navigationCenter: NavigationCenterType = self.createRootNav(viewController: router.viewController)
        router.setNavigation(navigation: navigationCenter)
        guard let navigationController = navigationCenter.navigation?.navigation,
              router.navigation != nil else {
                  throw CoordinatorError(message: "Error, router not setter to navigation center, please check setNavigation implementation in \(router.self) ")
        }
        window.rootViewController = navigationController
        window.makeKeyAndVisible()
    }

}

public enum RootType {
    case navigation
    case tabNavigation
}
