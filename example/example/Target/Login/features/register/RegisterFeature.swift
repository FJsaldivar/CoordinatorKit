//
//  RegisterFeature.swift
//  example
//
//  Created by Francisco Javier Saldivar Rubio on 16/12/21.
//

import Foundation
import Coordinator
import UIKit
final class RegisterFeature: Feature {
    static var route: String { LoginRoutes.register.rawValue }
    
    static func build(navigationCenter: NavigationCenterType) async throws -> UIViewController {
        let interactor = RegisterInteracotr()
        let router = RegisterRouter(nav: navigationCenter)
        let presenter = RegisterPresenter(interactor: interactor, router: router)
        let view = await RegisterView(presenter: presenter)
        return view
    }
}
