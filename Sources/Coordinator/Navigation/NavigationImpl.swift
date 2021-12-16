//
//  File.swift
//  
//
//  Created by Francisco Javier Saldivar Rubio on 02/12/21.
//

import Foundation
import UIKit
public struct Navigation: StackNavigable {
    
    public let controller: UINavigationController
    public let coordinator: Coordinator
    
    public init(cordinator: Coordinator, navigation: UINavigationController) {
        self.controller = navigation
        self.coordinator = cordinator
    }
}

public final class NavigationCenter: NavigationCenterType {

    public var navigation: StackNavigable?
    
    private var coordinator: Coordinator!

    public func setCoordinator(coordintarot: Coordinator) {
        self.coordinator = coordintarot
    }
    
    public func createRootNavigationController(navigation: UINavigationController) {
        self.navigation = Navigation(cordinator: coordinator, navigation: navigation)
        coordinator.window.rootViewController = navigation
        coordinator.window.makeKeyAndVisible()
    }
}
