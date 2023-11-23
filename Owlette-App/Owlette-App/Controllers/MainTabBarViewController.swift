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
        vc.tabBarItem = UITabBarItem(title: nil, image: UIImage(systemName: "building.columns.fill"), tag: 0)
        return vc
    }()
    
    public lazy var statementsViewController: UIViewController = {
        let vc = StatementsViewController()
        vc.tabBarItem = UITabBarItem(title: nil, image: UIImage(systemName: "megaphone"), tag: 1)
        return vc
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        viewControllers = [UINavigationController(rootViewController: membersViewController), statementsViewController]
    }

}

