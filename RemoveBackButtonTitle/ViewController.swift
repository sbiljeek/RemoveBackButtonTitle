//
//  ViewController.swift
//  RemoveBackButtonTitle
//
//  Created by Salman Biljeek on 1/25/23.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .systemBackground
        
        self.removeBackButtonTitle()
        
        let pushButton: UIButton = {
            var configuration = UIButton.Configuration.filled()
            var container = AttributeContainer()
            container.font = .boldSystemFont(ofSize: 18)
            container.foregroundColor = .systemBackground
            configuration.attributedTitle = AttributedString("Push", attributes: container)
            configuration.contentInsets = NSDirectionalEdgeInsets(top: 15, leading: 25, bottom: 15, trailing: 25)
            configuration.baseBackgroundColor = .label
            configuration.cornerStyle = .capsule
            
            let button = UIButton(configuration: configuration, primaryAction: nil)
            button.translatesAutoresizingMaskIntoConstraints = false
            button.addTarget(self, action: #selector(self.handlePush), for: .touchUpInside)
            return button
        }()
        
        pushButton.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(pushButton)
        pushButton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        pushButton.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
    }
    
    @objc fileprivate func handlePush() {
        let viewController2 = UIViewController()
        viewController2.view.backgroundColor = .systemBackground
        self.navigationController?.pushViewController(viewController2, animated: true)
    }
}

extension UIViewController {
    func removeBackButtonTitle() {
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
    }
}
