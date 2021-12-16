//
//  AppCoordinator.swift
//  example
//
//  Created by Francisco Javier Saldivar Rubio on 16/12/21.
//

import Foundation
import Coordinator
import UIKit

struct AppCoordinator: Coordinator {
    var navigationCenter: NavigationCenterType!    
    var modules: [ModuleRouteable.Type] {
        return [SplashModule.self,
                LoginModule.self]
    }
    
    var window: UIWindow
    
}
