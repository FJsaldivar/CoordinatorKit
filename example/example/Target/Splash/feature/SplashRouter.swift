//
//  SplashRouter.swift
//  example
//
//  Created by Francisco Javier Saldivar Rubio on 15/12/21.
//

import Foundation
import Coordinator

protocol SplashRouterable: Routerable {
    func openLogin()
}

struct SplashRouter: SplashRouterable {
    var coordinator: Coordinator

    func openLogin() {
        Task {
                try await coordinator
                .getFeature(route: LoginRoutes.login)
                .init()
                .start(coordinator: coordinator,
                       navigationState: .push)
            
        }
    }
}
