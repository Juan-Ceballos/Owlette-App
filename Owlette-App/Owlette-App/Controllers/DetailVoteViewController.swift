//
//  DetailVoteViewController.swift
//  Owlette-App
//
//  Created by Juan ceballos on 10/27/23.
//

import UIKit

class DetailVoteViewController: UIViewController {
    
    let detailVoteView = DetailVoteView()
    
    init(voteDetails: ProVote? = nil) {
        self.voteDetails = voteDetails
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var voteDetails: ProVote?
    
    override func loadView() {
        view = detailVoteView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        detailVoteView.closeButton.addTarget(self, action: #selector(closeButtonPressed), for: .touchUpInside)
        setupUI()
    }
    
    private func setupUI() {
        detailVoteView.voteTitleTextView.text = voteDetails?.bill.title ?? "Nothing Here"
        detailVoteView.billNumberLabel.text = voteDetails?.bill.number ?? "Nothing Here" 
    }
    
    @objc func closeButtonPressed(_ sender: UIButton) {
        dismiss(animated: true)
    }

}
