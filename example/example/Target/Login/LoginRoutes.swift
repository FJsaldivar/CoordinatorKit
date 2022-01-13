//
//  LoginRoutes.swift
//  example
//
//  Created by Francisco Javier Saldivar Rubio on 16/12/21.
//

import Foundation
import Coordinator

enum LoginRoutes: String {
    case recovery
    case register
    case login
}

extension LoginRoutes: Routeable {
    var dependecy: Dependenciable? {
        get {
            nil
        }
        set(newValue) {
            
        }
    }
    
    static var module: String { "Login" }
    var route: String { self.rawValue }
}
