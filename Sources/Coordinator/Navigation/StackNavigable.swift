//
//  File.swift
//  
//
//  Created by Francisco Javier Saldivar Rubio on 01/12/21.
//

import Foundation
import UIKit

private struct NavigationAction {
    var window: UIWindow
    var action: ((UIWindow) -> Void)
}

public enum NavigationState {
    case singleRoot
    case rootNavigation
    case push
}

public extension NavigationState {
    
    func build(window: UIWindow, view: UIViewController) {
        let action = NavigationAction.self
        switch self {
        case .singleRoot:
            action.singleRoot(window: window, view: view)
        case .rootNavigation:
            action.rootNavigation(window: window, view: view)
        case .push:
            action.push(window: window, view: view)
        
        }
    }
}

extension NavigationAction {
    
    static func singleRoot(window: UIWindow, view: UIViewController) {
        DispatchQueue.main.async {
            window.rootViewController = view
            window.makeKeyAndVisible()
        }
        
    }
    
    static func push(window: UIWindow, view: UIViewController) {
        DispatchQueue.main.async {
            guard let navigationController = window.rootViewController as? UINavigationController else {
                rootNavigation(window: window, view: view)
                return
            }
            navigationController.pushViewController(view, animated: true)
        }
        
    }
    
    static func rootNavigation(window: UIWindow, view: UIViewController) {
        let navigationController = UINavigationController(rootViewController: view)
        window.rootViewController = navigationController
        window.makeKeyAndVisible()
    }
}

