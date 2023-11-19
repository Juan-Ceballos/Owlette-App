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
        detailVoteView.voteTitleTextView.text = "\(voteDetails?.bill.title ?? "Nothing Here") \(voteDetails?.bill.number ?? "Nothing Here")."
        detailVoteView.voteDescriptionTextView.text = voteDetails?.description ?? "Nothing Here"
        detailVoteView.latestActionTextView.text = voteDetails?.bill.latestAction ?? "Nothing Here"
        detailVoteView.positionLabel.text = "Position: \(voteDetails?.position ?? "Nothing Here")"
        detailVoteView.resultLabel.text = "Result: \(voteDetails?.result ?? "Nothing Here")"
        detailVoteView.yesVotesLabel.text = "Yes: \(String(voteDetails?.total.yes ?? 0))"
        detailVoteView.noVotesLabel.text = "No: \(String(voteDetails?.total.no ?? 0))"
        detailVoteView.presentVotesLabel.text = "Present: \(String(voteDetails?.total.present ?? 0))"
        detailVoteView.notVotingVotesLabel.text = "Not Voting: \(String(voteDetails?.total.notVoting ?? 0))"
    }
    
    @objc func closeButtonPressed(_ sender: UIButton) {
        dismiss(animated: true)
    }

}
