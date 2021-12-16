//
//  File.swift
//  
//
//  Created by Francisco Javier Saldivar Rubio on 01/12/21.
//

import Foundation
import UIKit

public protocol Routeable {
    static var module: String { get }
    var route: String { get }
}

public protocol ModuleRouteable {
    var routes: [Feature.Type] { get }
    static var route: String { get }
    static var typeOf: Modulable.Type { get }
}

public protocol FeatureRouteable {
    static var route: String { get }
    static var typeOf: Feature.Type { get }
}

public protocol Routerable {
    var nav: NavigationCenterType { set get }
}


