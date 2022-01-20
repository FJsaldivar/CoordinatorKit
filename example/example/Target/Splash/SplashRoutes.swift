//
//  ModuleRoutes.swift.swift
//  example
//
//  Created by Francisco Javier Saldivar Rubio on 15/12/21.
//

import Foundation
import Coordinator

public protocol SplashRoutable: Routeable { }

public extension SplashRoutable {
    static var module: String { "Splash" }
}

public struct SplashRoutes: SplashRoutable {

    public var dependecy: Dependenciable?
    public var link: Linkable
    
    init(link: SplashLinks, dependency: SplashDependenciable) {
        self.link = link
        self.dependecy = dependency
    }
}

public enum SplashLinks: String, Linkable {
    public var value: String { return self.rawValue }

    case splash
    
}

public extension SplashLinks {

    static func splashLink(dependency: SplashDependenciable) -> SplashRoutes {
        return .init(link: .splash, dependency: dependency)
    }
}
