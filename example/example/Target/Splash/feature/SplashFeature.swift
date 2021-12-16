//
//  Splash.swift
//  example
//
//  Created by Francisco Javier Saldivar Rubio on 15/12/21.
//

import Foundation
import Coordinator
import UIKit

final class SplashFeature: Feature {
    
    static var typeOf: Feature.Type {
        Self.self
    }
    
    static var route: String {
        SplashRoutes.splash.rawValue
    }
    

    static func build(navigationCenter: NavigationCenterType) async throws -> UIViewController {
        let router: SplashRouterable = SplashRouter(nav: navigationCenter)
        let interactor: SplashInteractable = SplashInteractor()
        
        let presenter: SplashPresentable = SplashPresenter(interactor: interactor, router: router)
        
        return await SplashView(presenter: presenter)
    }
}
