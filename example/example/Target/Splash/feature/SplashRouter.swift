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
    var nav: NavigationCenterType
    
    
    func openLogin() {
        Task {
            do{
                try await nav.navigation?.setRootModule(LoginRoutes.login, dependency: nil, hideBar: true)
            } catch let error {
                print(error.localizedDescription)
            }
        }
        
    }
}
