//
//  RegisterView.swift
//  example
//
//  Created by Francisco Javier Saldivar Rubio on 16/12/21.
//

import Foundation
import UIKit
final class RegisterView: UIViewController, RegisterViewable {
    let presenter: RegisterPresentable

    init(presenter: RegisterPresentable) {
        self.presenter = presenter
        super.init()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
