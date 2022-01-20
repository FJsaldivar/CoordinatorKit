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
    var label: UILabel
    
    required init(presenter: SplashPresentable) {
        self.presenter = presenter
        label = .init()
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        load()
        view.backgroundColor = .white
        configure()
    }

    func load() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 5) {[weak self] in
            self?.presenter.openLogin()
        }
    }
    
    func configure() {
        view.addSubview(label)
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        label.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        label.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        label.text = "Coordinator \n Loading App"
        view.showBlurLoader()
    }
}

extension UIView {
    func fadeTransition(_ duration:CFTimeInterval) {
        let animation = CATransition()
        animation.timingFunction = CAMediaTimingFunction(name:
            CAMediaTimingFunctionName.easeInEaseOut)
        animation.type = CATransitionType.fade
        animation.duration = duration
        layer.add(animation, forKey: CATransitionType.fade.rawValue)
    }
}

extension UIView {
    func showBlurLoader() {
        let blurLoader = BlurLoader(frame: frame)
        self.addSubview(blurLoader)
    }

    func removeBluerLoader() {
        if let blurLoader = subviews.first(where: { $0 is BlurLoader }) {
            blurLoader.removeFromSuperview()
        }
    }
}


class BlurLoader: UIView {

    var blurEffectView: UIVisualEffectView?

    override init(frame: CGRect) {
        let blurEffect = UIBlurEffect(style: .extraLight)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.frame = frame
        blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        self.blurEffectView = blurEffectView
        super.init(frame: frame)
        addSubview(blurEffectView)
        addLoader()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func addLoader() {
        guard let blurEffectView = blurEffectView else { return }
        let lable = UILabel.init(frame: CGRect(x: 0, y: -15, width: 200, height: 50))
        lable.textAlignment = .center
        lable.text = "Loading Screen ..."
        let activityIndicator = UIActivityIndicatorView(style: .large)
        activityIndicator.frame = CGRect(x: 0, y: 0, width: 50, height: 50)
        blurEffectView.contentView.addSubview(lable)
        blurEffectView.contentView.addSubview(activityIndicator)
        activityIndicator.center = blurEffectView.contentView.center
        lable.center = CGPoint(x: activityIndicator.center.x, y: activityIndicator.center.y + 120)
        activityIndicator.startAnimating()
    }
}

