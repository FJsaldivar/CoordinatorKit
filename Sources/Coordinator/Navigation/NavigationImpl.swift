//
//  File.swift
//  
//
//  Created by Francisco Javier Saldivar Rubio on 02/12/21.
//

import Foundation
import UIKit
public struct Navigation: StackNavigable {
    public let navigation: UINavigationController
    public let coordinator: Coordinator
    
    public init(cordinator: Coordinator, navigation: UINavigationController) {
        self.navigation = navigation
        self.coordinator = cordinator
    }
}

public struct NavigationCenter: NavigationCenterType {
    public var navigation: StackNavigable?
    public var tabNavigation: TabNavigationType?
    
    public init(window: UIWindow, coordinator: Coordinator) {
        
    }
}
