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
    
    public lazy var viewController2: UIViewController = {
        let vc = ViewController2()
        vc.tabBarItem = UITabBarItem(title: nil, image: UIImage(systemName: "book"), tag: 1)
        return vc
    }()
    
    public lazy var viewController3: UIViewController = {
        let vc = ViewController3()
        vc.tabBarItem = UITabBarItem(title: nil, image: UIImage(systemName: "gear"), tag: 2)
        return vc
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = .systemBackground
        viewControllers = [UINavigationController(rootViewController: membersViewController), viewController2, viewController3]
    }
    
    

}

