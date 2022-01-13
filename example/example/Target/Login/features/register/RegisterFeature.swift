//
//  RegisterFeature.swift
//  example
//
//  Created by Francisco Javier Saldivar Rubio on 16/12/21.
//

import Foundation
import Coordinator
import UIKit
struct RegisterFeature: Feature {
    static var route: String { LoginRoutes.register.rawValue }
    var dependency: Dependenciable!

    init(dependency: Dependenciable) throws {
        self.dependency = dependency
    }
    
    init() throws {
    }
}

extension RegisterFeature {
    func buildView(coordinator: Coordinator) async -> UIViewController {
        let interactor = RegisterInteractor()
        let router = RegisterRouter(coordinator: coordinator)
        let presenter = RegisterPresenter(interactor: interactor, router: router)
        return await RegisterView(presenter: presenter)
    }
    
    
    func start(coordinator: Coordinator, navigationState: NavigationState) throws {
        Task {
            let view = await self.buildView(coordinator: coordinator)
            navigationState.build(window: coordinator.window, view: view)
        }
    }
}
