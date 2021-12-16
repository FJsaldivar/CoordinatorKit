//
//  RegisterPresenter.swift
//  example
//
//  Created by Francisco Javier Saldivar Rubio on 16/12/21.
//

import Foundation
final class RegisterPresenter: RegisterPresentable {
    let interactor: RegisterInteractable
    let router: RegisterRouterable
    
    init(interactor: RegisterInteractable, router: RegisterRouterable) {
        self.interactor = interactor
        self.router = router
    }
    
    
}
