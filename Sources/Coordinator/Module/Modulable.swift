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
    static func build<T: Dependenciable>(dependency: T) async throws -> Modulable
    func getFeature(route: Routeable) async throws -> Feature.Type
}

public extension Modulable {

    static var typeOf: Modulable.Type {
        Self.self
    }
    
    static func build() async throws -> Modulable {
        throw CoordinatorError(message: "\(#function)This method not is implement")
    }
    
    static func build<T: Dependenciable>(dependency: T) async throws -> Modulable {
        try await build()
    }
    
    func getFeature(route: Routeable) async throws -> Feature.Type {
        
        guard let feature = routes.first(where: {route.link == $0.link}) else {
            throw CoordinatorError.init(message: "\(Self.self) not register Feature \(route.link.value)")
        }

        return feature
    }
}

public protocol Feature: FeatureRouteable {
    init(dependency: Dependenciable) throws
    init() throws

    func start(coordinator: Coordinator, navigationState: NavigationState)  throws
    func buildView(coordinator: Coordinator) async -> UIViewController

}

public extension Feature {
    
    static var typeOf: Feature.Type {
        Self.self
    }

    init() throws {
        throw CoordinatorError(message: "Not implement")
    }
    
    init(dependency: Dependenciable) throws {
        throw CoordinatorError(message: "Not implement")
    }
    
}
