//
//  DetailVoteViewController.swift
//  Owlette-App
//
//  Created by Juan ceballos on 10/27/23.
//

import UIKit

class DetailVoteViewController: UIViewController {
    
    let detailVoteView = DetailVoteView()
    
    override func loadView() {
        view = detailVoteView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

}
