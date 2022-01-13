//
//  ModuleRoutes.swift.swift
//  example
//
//  Created by Francisco Javier Saldivar Rubio on 15/12/21.
//

import Foundation
import Coordinator

public struct SplashRoutes: Routeable {
   public var dependecy: Dependenciable?
   public var route: String
   static public var module: String { "Splash" }
}

public extension SplashRoutes {

    static func getSplashRoute(dependecy: SplashDependenciable) -> SplashRoutes {
        return .init(dependecy: dependecy, route: path.splash.rawValue)
    }
}

extension SplashRoutes {
    enum path: String {
        case splash
    }
}
