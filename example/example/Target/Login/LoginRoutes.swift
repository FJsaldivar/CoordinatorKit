//
//  LoginRoutes.swift
//  example
//
//  Created by Francisco Javier Saldivar Rubio on 16/12/21.
//

import Foundation
import Coordinator


protocol LoginRouteable: Routeable { }

extension LoginRouteable {
    public static var module: String { "Login"}
}

public struct LoginRoute: LoginRouteable {
    
    public var dependecy: Dependenciable?
    
    public var link: Linkable

}

public enum LoginLink: String, Linkable {
    public var value: String { return self.rawValue }
    
    case recovery
    case register
    case login
    
    static func getRoute(_ link: LoginLink) -> LoginRoute {
        return .init(dependecy: nil, link: link)
    }
}
