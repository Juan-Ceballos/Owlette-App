//
//  ViewController.swift
//  Owlette-App
//
//  Created by Juan ceballos on 8/9/23.
//

import UIKit

class MainTabBarViewController: UITabBarController {
    
    public lazy var membersViewController: UIViewController = {
        let vc = MembersViewController()
        vc.tabBarItem = UITabBarItem(title: nil, image: UIImage(systemName: "person"), tag: 0)
        return vc
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        viewControllers = [UINavigationController(rootViewController: membersViewController)]
    }

}

