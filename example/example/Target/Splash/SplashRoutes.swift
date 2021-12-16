//
//  ModuleRoutes.swift.swift
//  example
//
//  Created by Francisco Javier Saldivar Rubio on 15/12/21.
//

import Foundation
import Coordinator

public enum SplashRoutes: String {
    case splash
}

extension SplashRoutes: Routeable {
    static public var module: String { "Splash" }
    public var route: String { self.rawValue }
}

