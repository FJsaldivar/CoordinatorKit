//
//  File.swift
//  
//
//  Created by Francisco Javier Saldivar Rubio on 01/12/21.
//

import Foundation
import UIKit

public protocol NavigationDependecy {
    var cordinator: Coordinator { get }
}

public protocol StackNavigable {
    var coordinator: Coordinator { get }
    var controller: UINavigationController { get }
    
    func present(_ route: Routeable, dependency: Dependenciable,  animated: Bool, completion: (() -> Void)?) throws
    func push(_ route: Routeable, dependency: Dependenciable, animated: Bool) async throws
    func popModule(animated: Bool)
    func dismissModule(animated: Bool, completion: (() -> Void)?)
    func setRootModule(_ route:  Routeable, dependency: Dependenciable?, hideBar: Bool) async throws
    func popToRootModule(animated: Bool)
}

extension StackNavigable {
    
    public func present(_  route: Routeable, dependency: Dependenciable, animated: Bool, completion: (() -> Void)?) throws {
        
    }
    
    public func push(_ route: Routeable, dependency: Dependenciable = Dependency(), animated: Bool) async throws {
        let view = try await coordinator.getFeature(route: route).build(navigationCenter: coordinator.navigationCenter)
        await controller.pushViewController(view, animated: true)
    }
    
    public func popModule(animated: Bool) {
        Task {
            controller.popViewController(animated: animated)
        }
    }
    
    public func dismissModule(animated: Bool, completion: (() -> Void)?) {
        
    }
    
    public func setRootModule(_ route:  Routeable, dependency: Dependenciable? = nil, hideBar: Bool) async throws {
        let view = try await coordinator.getFeature(route: route).build(navigationCenter: coordinator.navigationCenter)
        await controller.setViewControllers([view], animated: true)
    }
    
    public func popToRootModule(animated: Bool) {
        
    }
}


public protocol NavigationCenterType: AnyObject {
    var navigation: StackNavigable? { get }

    func createRootNavigationController(navigation: UINavigationController)
    
    func setCoordinator(coordintarot: Coordinator)
}

public enum NavigationState {
    case start
    case push
    case pop
}
