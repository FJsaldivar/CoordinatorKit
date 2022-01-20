//
//  LoginModule.swift
//  example
//
//  Created by Francisco Javier Saldivar Rubio on 16/12/21.
//

import Foundation
import Coordinator

final class LoginModule: Modulable {
    var routes: [Feature.Type] {
        [LoginFeature.self,
         RegisterFeature.self]
    }
    
    static var moduleIdentifier: String { LoginRoute.module }
    
    static func build() async throws -> Modulable {
        Self.init()
    }
}
