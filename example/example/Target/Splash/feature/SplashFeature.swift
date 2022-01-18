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
    
    var dependency: SplashDependenciable

    
    init(dependency: Dependenciable) throws {
        self.dependency = try map(value: dependency)
    }
    

}

extension SplashFeature {

    func buildView(coordinator: Coordinator) async -> UIViewController {
       let router: SplashRouterable = SplashRouter(coordinator: coordinator)
       let interactor: SplashInteractable = SplashInteractor()
       
       let presenter: SplashPresentable = SplashPresenter(interactor: interactor, router: router)
       
       return await SplashView(presenter: presenter)
   }
}
