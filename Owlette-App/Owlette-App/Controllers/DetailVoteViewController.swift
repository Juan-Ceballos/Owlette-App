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
        detailVoteView.closeButton.addTarget(self, action: #selector(closeButtonPressed), for: .touchUpInside)
    }
    
    @objc func closeButtonPressed(_ sender: UIButton) {
        dismiss(animated: true)
    }

}
