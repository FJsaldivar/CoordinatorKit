//
//  Module.swift
//  example
//
//  Created by Francisco Javier Saldivar Rubio on 15/12/21.
//

import Foundation
import Coordinator
import UIKit
final class SplashModule: Modulable {
    var routes: [Feature.Type] {
        [SplashFeature.self]
    }
    
    static var route: String {
        SplashRoutes.module
    }
    static func build() async throws -> Modulable {
        return Self()
    }
}
