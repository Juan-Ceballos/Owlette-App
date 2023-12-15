//
//  AboutViewController.swift
//  Owlette-App
//
//  Created by Juan ceballos on 12/15/23.
//

import UIKit

class AboutViewController: UIViewController {
    
    let aboutView = AboutView()
    
    override func loadView() {
        view = aboutView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

}
