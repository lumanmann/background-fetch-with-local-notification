//
//  RootViewController.swift
//  BackgroundFetchWithLocalNotification
//
//  Created by Natalie Ng on 2019/11/15.
//  Copyright © 2019 Natalie. All rights reserved.
//

import UIKit

class RootViewController: UIViewController {
    
    var showNotificationButton: UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setTitle("Show Notification", for: .normal)
        btn.setTitleColor(.black, for: .normal)
        btn.addTarget(self, action: #selector(toViewController), for: .touchUpInside)
        return btn
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
    }
    
    private func setupView() {
        view.backgroundColor = .white
        view.addSubview(showNotificationButton)
        
        NSLayoutConstraint.activate([
            showNotificationButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            showNotificationButton.centerYAnchor.constraint(equalTo: view.centerYAnchor)
            ])
    }
    

    @objc
    func toViewController() {
        let vc = ViewController()
        self.present(vc, animated: true, completion: nil)
    }

}
