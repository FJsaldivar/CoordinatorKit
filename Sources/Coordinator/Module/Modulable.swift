//
//  File.swift
//  
//
//  Created by Francisco Javier Saldivar Rubio on 01/12/21.
//

import Foundation
import UIKit

public struct FeatureItem {
    public var route: Routeable
    public var feature: FeatureRouteable.Type
    
    public init(route: Routeable, feature: FeatureRouteable.Type) {
        self.route = route
        self.feature = feature
    }
}

public protocol Modulable: ModuleRouteable {
    static func build() async throws -> Modulable
    static func build(dependency: Dependency) async throws -> Modulable
    func getFeature(route: Routeable) async throws -> Feature.Type
}

public extension Modulable {

    static var typeOf: Modulable.Type {
        Self.self
    }
    
    static func build() async throws -> Modulable {
        throw CoordinatorError(message: "\(#function)This method not is implement")
    }
    static func build(dependency: Dependency) async throws -> Modulable {
        try await build()
    }
    
    func getFeature(route: Routeable) async throws -> Feature.Type {
        guard let feature = routes.first(where: {route.route == $0.route}) else {
            throw CoordinatorError.init(message: "\(Self.self) not contain \(route.route)")
        }
        
        return feature
    }
}

public protocol Feature: FeatureRouteable {
    static func build(navigationCenter: NavigationCenterType) async throws -> UIViewController
    static func build(navigationCenter: NavigationCenterType, dependency: Dependenciable) async throws -> UIViewController
}


public extension Feature {
    
    static var typeOf: Feature.Type { Self.self }

    static func build(navigationCenter: NavigationCenterType) async throws -> UIViewController {
        throw CoordinatorError(message: "\(#function)This method not is implement")
    }
    
    static func build(navigationCenter: NavigationCenterType, dependency: Dependenciable) async throws -> UIViewController {
        try await Self.build(navigationCenter: navigationCenter)
    }
}
