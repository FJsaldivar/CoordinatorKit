//
//  Splash.swift
//  example
//
//  Created by Francisco Javier Saldivar Rubio on 15/12/21.
//

import Foundation
import Coordinator
import UIKit

struct SplashFeature: Feature {
    
    static var link: Linkable { SplashLinks.splash }
    
    var dependency: SplashDependency

    
    init(dependency: Dependenciable) throws {
        self.dependency = try dependency.transform()
    }

}

extension SplashFeature {

    func buildView(coordinator: Coordinator) async -> UIViewController {
       let router: SplashRouterable = SplashRouter(coordinator: coordinator)
       let interactor: SplashInteractable = SplashInteractor()
       
       let presenter: SplashPresentable = SplashPresenter(interactor: interactor, router: router)
       
       return await SplashView(presenter: presenter)
   }
   
   func start(coordinator: Coordinator, navigationState: NavigationState) throws {
       Task {
           let view = await self.buildView(coordinator: coordinator)
           navigationState.build(window: coordinator.window, view: view)
       }
   }
}
