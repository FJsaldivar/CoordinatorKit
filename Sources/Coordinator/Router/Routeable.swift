//
//  File.swift
//  
//
//  Created by Francisco Javier Saldivar Rubio on 01/12/21.
//

import Foundation
import UIKit

public protocol Routeable {
    static var route: String { get }
    static var typeOf: Modulable.Type { get }
}

public struct Route {
    var type: Routeable
}

public protocol Routerable: AnyObject {
    var viewController: UIViewController { set get }
    var navigation: NavigationCenterType! { set get }
    
    init(viewController: UIViewController)
    
    func setNavigation(navigation: NavigationCenterType)
}

extension Routerable {

    public func setNavigation(navigation: NavigationCenterType) {
        self.navigation = navigation
    }
}
