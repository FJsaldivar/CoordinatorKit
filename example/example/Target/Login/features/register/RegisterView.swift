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
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .green
        title = "Rregister"
        self.setUp()
    }
    
}

extension RegisterView {

    func setUp() {
        let view: UIView = UIView()
        let mailTextView = UITextField()
        mailTextView.backgroundColor = .white
        mailTextView.keyboardType = .emailAddress
        mailTextView.placeholder = "Email"
        mailTextView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(mailTextView)
        mailTextView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        mailTextView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        mailTextView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        
        let pwdTextView = UITextField()
        pwdTextView.keyboardType = .emailAddress
        pwdTextView.backgroundColor = .white
        pwdTextView.placeholder = "Password"
        pwdTextView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(pwdTextView)
        pwdTextView.topAnchor.constraint(equalTo: mailTextView.bottomAnchor).isActive = true
        pwdTextView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        pwdTextView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        pwdTextView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
        view.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(view)
        
        view.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width * 0.5).isActive = true
        view.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        view.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
    }
}
