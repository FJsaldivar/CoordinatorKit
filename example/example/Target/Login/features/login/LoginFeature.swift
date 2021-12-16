//
//  LoginFeature.swift
//  example
//
//  Created by Francisco Javier Saldivar Rubio on 16/12/21.
//

import Foundation
import Coordinator
import UIKit

final class LoginFeature: Feature {

    static var route: String { LoginRoutes.login.rawValue }
    
    static func build(navigationCenter: NavigationCenterType) async throws -> UIViewController {
        let inreractor = LoginInteractor()
        let router = LoginRouter(nav: navigationCenter)
        let presenter = LoginPresenter(interactor: inreractor, router: router)

        return await LoginView(presenter: presenter)
    }

}
