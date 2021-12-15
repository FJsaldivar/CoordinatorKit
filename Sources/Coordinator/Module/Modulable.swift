//
//  File.swift
//  
//
//  Created by Francisco Javier Saldivar Rubio on 01/12/21.
//

import Foundation
import UIKit

public protocol Modulable {
    static var view: UIViewController.Type { get }
    static func build(navigationCenter: NavigationCenterType)
    static func build() throws -> Routerable
    static func build(dependency: Dependenciable) throws -> Routerable
}

public extension Modulable {

    static func build() throws -> Routerable {
        throw CoordinatorError(message: "This method not is implement")
    }

    static func build(dependency: Dependenciable) throws -> Routerable {
        throw CoordinatorError(message: "This method not is implement")
    }
}
