//
//  RegisterProtocol.swift
//  example
//
//  Created by Francisco Javier Saldivar Rubio on 16/12/21.
//

import Foundation
import Coordinator
protocol RegisterInteractable { }
protocol RegisterRouterable: Routerable {}
protocol RegisterPresentable {
    init(interactor: RegisterInteractable, router: RegisterRouterable)
}
protocol RegisterViewable {
    init(presenter: RegisterPresentable)
}
