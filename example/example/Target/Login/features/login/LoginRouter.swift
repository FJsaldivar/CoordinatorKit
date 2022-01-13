//
//  LoginRouter.swift
//  example
//
//  Created by Francisco Javier Saldivar Rubio on 16/12/21.
//

import Foundation
import Coordinator


struct LoginRouter: LoginRouterable {
    var coordinator: Coordinator
    
    func pushRegister() {
        run({
            try await coordinator
                .getFeature(route: LoginRoutes.recovery)
                .init()
                .start(coordinator: coordinator, navigationState: .push)
        }, error: { error in
            print(error.localizedDescription)
        })
    }
    
}
