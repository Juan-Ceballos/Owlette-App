//
//  DetailMembersViewController.swift
//  Owlette-App
//
//  Created by Juan ceballos on 10/3/23.
//

import UIKit

class DetailMembersViewController: UIViewController {
    
    let proPublicaAPI = ProPublicaAPI()
    var votingRecord = [ProVote]()
    
    init(member: ProMemberState? = nil) {
        self.member = member
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var member: ProMemberState?
    let detailMemberView = DetailMemberView()
    
    override func loadView() {
        view = detailMemberView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        detailMemberView.websiteTextView.delegate = self
        detailMemberView.voteCV.dataSource = self
        detailMemberView.voteCV.delegate = self
        setupUI()
        print(member?.id.uppercased() ?? "")
    }
    
    func fetchVoteModel(pathComponent: String) async -> ProVotesContainer? {
        do {
            let votesModel = try await proPublicaAPI.fetchParseData(pathComponent: pathComponent, responseType: ProVotesContainer.self)
            detailMemberView.activityIndicator.stopAnimating()
            return votesModel
        }
        catch {
            print(error)
            showAlert(title: "Error \u{1f622}", message: "Missing info, please go back to try again")
            detailMemberView.activityIndicator.stopAnimating()
        }
        return nil
    }
    
    func populateVotes() async {
        let votes = await fetchVoteModel(pathComponent: "members/\(member?.id.uppercased() ?? "")/votes.json")
        votingRecord = votes?.results.first?.votes ?? [ProVote]()
    }
    
    func updateVoteCV() {
        Task {
            await populateVotes()
            DispatchQueue.main.async {
                self.detailMemberView.voteCV.reloadData()
            }
        }
    }
    
    func setupUI() {
        detailMemberView.activityIndicator.startAnimating()
        setMemberImage()
        updateVoteCV()

        Task {
            await setupNameLabel()
            await setMemberUrlLabel()
        }
        detailMemberView.partyTextView.backgroundColor = getPartyColor()
        detailMemberView.districtLabel.text = "\(member?.role ?? "Third")/\(member?.district ?? "")"
        detailMemberView.seniorityLabel.text = member?.seniority ?? "0"
    }
    
    func getPartyColor() -> UIColor {
        switch member?.party.lowercased() {
        case "r":
            return UIColor.systemRed
        case "d":
            return UIColor.systemBlue
        default:
            return UIColor.systemGray
        }
    }
    
    func setupLinkText(url: String) -> NSMutableAttributedString {
        let attributedString = NSMutableAttributedString(string: "More Info")
        let linkRange = NSRange(location: 0, length: attributedString.length)
        let customFont = AppFonts.linkFont
        
        attributedString.addAttribute(.link, value: url, range: linkRange)
        attributedString.addAttribute(.foregroundColor, value: UIColor.blue, range: linkRange)
        attributedString.addAttribute(.font, value: customFont, range: linkRange)
        
        return attributedString
    }
    
    func setMemberImage() {
        Task {
            try await detailMemberView.depictionImageView.setImage(from: URL(string: "https://www.congress.gov/img/member/\(member!.id.lowercased())_200.jpg")!)
        }
    }
    
    func setMemberUrlLabel() async {
        let detailMember = await fetchMemberById(memberId: member?.id ?? "No Id")
        let webUrl = detailMember?.results.first?.url
        detailMemberView.websiteTextView.attributedText = setupLinkText(url: webUrl ?? "Reload for URL")
    }
    
    func setupNameLabel() async {
        detailMemberView.nameLabel.text = member?.name ?? "No Name"
    }
    
    func fetchMemberById(memberId: String) async -> MemberIdModelContainer? {
        do {
            let detailMember = try await proPublicaAPI.fetchParseData(pathComponent: "members/\(memberId.lowercased()).json", responseType: MemberIdModelContainer.self)
            return detailMember
        }
        catch {
            print("error: \(error)")
            showAlert(title: "Error \u{1f622}", message: "Missing info, please go back to try again")
            detailMemberView.activityIndicator.stopAnimating()
        }
        return nil
    }
    
}

extension DetailMembersViewController: UITextViewDelegate {
    func textView(_ textView: UITextView, shouldInteractWith URL: URL, in characterRange: NSRange, interaction: UITextItemInteraction) -> Bool {
        UIApplication.shared.open(URL)
        return false
    }
}

extension DetailMembersViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        votingRecord.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: VoteCell.voteCellReuseId, for: indexPath) as? VoteCell else {
            fatalError()
        }
        let currentVoteRecord = votingRecord[indexPath.row]
        cell.billNumberLabel.text = "Bill Number: \(currentVoteRecord.bill.number)"
        cell.voteRecordLabel.text = "Position: \(currentVoteRecord.position)"
        return cell
    }
}

extension DetailMembersViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let currentVoteRecord = votingRecord[indexPath.row]
        let vc = DetailVoteViewController(voteDetails: currentVoteRecord)
        vc.modalPresentationStyle = .overFullScreen
        vc.modalTransitionStyle = .crossDissolve
        present(vc, animated: true, completion: nil)
    }
}
