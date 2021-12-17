//
//  LoginRouter.swift
//  example
//
//  Created by Francisco Javier Saldivar Rubio on 16/12/21.
//

import Foundation
import Coordinator

struct LoginRouter: LoginRouterable {
    var nav: NavigationCenterType
    
    func pushRegister() {
        Task {
            do {
                try await nav.navigation?.push(LoginRoutes.register, animated: true)
            } catch let error {
                print(error.localizedDescription)
            }
        }
        
    }
}
