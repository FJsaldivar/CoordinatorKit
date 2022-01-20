//
//  LoginView.swift
//  example
//
//  Created by Francisco Javier Saldivar Rubio on 16/12/21.
//

import Foundation
import UIKit
final class LoginView: UIViewController, LoginViewable {
    let presenter: LoginPresentable
    let registerButton: UIButton
    let recoveryPasswordButton: UIButton
    
    init(presenter: LoginPresentable) {
        self.presenter = presenter
        registerButton = .init()
        recoveryPasswordButton = .init()
        super.init(nibName: nil, bundle: nil)
    }
    
    override func viewDidLoad() {
        self.view.backgroundColor = .red
        self.configureRegisterButton()
    }
    
    private func configureRegisterButton() {
        registerButton.setTitle("To Register", for: .normal)
        registerButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(registerButton)
        registerButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        registerButton.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        registerButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.5).isActive = true
        registerButton.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.1).isActive = true
        registerButton.addTarget(self, action: #selector(onRegister), for: .touchUpInside)
    }

    @objc private func onRegister() {
        presenter.toRegister()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
