//
//  PollViewController.swift
//  Owlette-App
//
//  Created by Juan ceballos on 11/20/23.
//

import UIKit

class StatementsViewController: UIViewController {
    
    let statementsView = StatementsView()
    
    override func loadView() {
        view = statementsView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }

}
