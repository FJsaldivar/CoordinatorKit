//
//  SplashDependency.swift
//  example
//
//  Created by Francisco Javier Saldivar Rubio on 12/01/22.
//

import Foundation
import Coordinator

public protocol SplashDependenciable: Dependenciable {
    var isFirstLauncher: Bool { get set }
}

