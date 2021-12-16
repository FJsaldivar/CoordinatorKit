//
//  LoginProtocols.swift.swift
//  example
//
//  Created by Francisco Javier Saldivar Rubio on 16/12/21.
//

import Foundation
import Coordinator

protocol LoginInteractable { }

protocol LoginRouterable: Routerable {
    func pushRegister()
}

protocol LoginPresentable {
    init(interactor: LoginInteractor, router: LoginRouterable)
}
protocol LoginViewable {
    init(presenter: LoginPresentable)
}
