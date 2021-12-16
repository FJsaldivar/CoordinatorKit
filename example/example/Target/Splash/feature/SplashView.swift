//
//  SplashView.swift
//  example
//
//  Created by Francisco Javier Saldivar Rubio on 15/12/21.
//

import Foundation
import UIKit

protocol SplashViewable {
    var presenter: SplashPresentable { get set }
    
    init(presenter: SplashPresentable)
}

class SplashView: UIViewController, SplashViewable {
    var presenter: SplashPresentable

    required init(presenter: SplashPresentable) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }
    
    
    override func viewDidLoad() {
        self.load()
        self.view.backgroundColor = .blue
    }
    
    func load() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {[weak self] in
            self?.presenter.openLogin()
        }
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}

