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
    }
    
}
