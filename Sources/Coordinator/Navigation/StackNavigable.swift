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
    var navigation: UINavigationController { get }
    
    func present(_ route: String, dependency: Dependenciable,  animated: Bool, completion: (() -> Void)?) throws
    func push(_ route: String, dependency: Dependenciable, animated: Bool) throws
    func popModule(animated: Bool)
    func dismissModule(animated: Bool, completion: (() -> Void)?)
    func setRootModule(_ route: String, dependency: Dependenciable?, hideBar: Bool) throws
    func popToRootModule(animated: Bool)
}

extension StackNavigable {
    public func present(_ route: String, dependency: Dependenciable, animated: Bool, completion: (() -> Void)?) throws {
        
    }
    
    public func push(_ route: String, dependency: Dependenciable, animated: Bool) throws {
        
    }
    
    public func popModule(animated: Bool) {
        
    }
    
    public func dismissModule(animated: Bool, completion: (() -> Void)?) {
        
    }
    
    public func setRootModule(_ route: String, dependency: Dependenciable?, hideBar: Bool) throws {
        try coordinator.initRootNavigationController(route: route, dependency: dependency)
    }
    
    public func popToRootModule(animated: Bool) {

    }
}

public protocol TabNavigationType {
    init(cordinator: Coordinator, navigation: UINavigationController)
}

public protocol NavigationCenterType {
    var navigation: StackNavigable? { get }
    var tabNavigation: TabNavigationType? { get }
    
    init(window: UIWindow, coordinator: Coordinator)
    
    func createRootNavigationController(navigation: UINavitagionController)
}

