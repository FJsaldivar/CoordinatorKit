//
//  SplashPresenter.swift
//  example
//
//  Created by Francisco Javier Saldivar Rubio on 15/12/21.
//

import Foundation
protocol SplashPresentable {
    var interactor: SplashInteractable { get set}
    var router: SplashRouterable { get set}
    func openLogin()
}

struct SplashPresenter: SplashPresentable {
    var interactor: SplashInteractable
    
    var router: SplashRouterable
    
    func openLogin() {
        router.openLogin()
    }
}
