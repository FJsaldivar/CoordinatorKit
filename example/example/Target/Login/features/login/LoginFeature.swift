//
//  LoginFeature.swift
//  example
//
//  Created by Francisco Javier Saldivar Rubio on 16/12/21.
//

import Foundation
import Coordinator
import UIKit

public struct LoginFeature: Feature {
    public static var link: Linkable { LoginLink.login }
    

    public init() throws {
        
    }
}

extension LoginFeature {

    public func buildView(coordinator: Coordinator) async -> UIViewController {
        let inreractor = LoginInteractor()
        let router = LoginRouter(coordinator: coordinator)
        let presenter = LoginPresenter(interactor: inreractor, router: router)
        return await LoginView(presenter: presenter)
    }
    
    public func start(coordinator: Coordinator, navigationState: NavigationState) {
        Task {
            let view = await self.buildView(coordinator: coordinator)
            navigationState.build(window: coordinator.window, view: view)
        }
    }
}
