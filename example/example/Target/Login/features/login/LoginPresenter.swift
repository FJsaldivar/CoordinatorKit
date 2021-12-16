//
//  LoginPresenter.swift
//  example
//
//  Created by Francisco Javier Saldivar Rubio on 16/12/21.
//

import Foundation
final class LoginPresenter: LoginPresentable {
    let interactor: LoginInteractor
    let router: LoginRouterable
    
    init(interactor: LoginInteractor, router: LoginRouterable) {
        self.interactor = interactor
        self.router = router
    }
}
