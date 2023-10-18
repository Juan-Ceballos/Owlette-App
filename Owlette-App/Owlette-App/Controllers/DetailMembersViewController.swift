//
//  DetailMembersViewController.swift
//  Owlette-App
//
//  Created by Juan ceballos on 10/3/23.
//

import UIKit

class DetailMembersViewController: UIViewController {
    
    let proPublicaAPI = ProPublicaAPI()
    
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
        setupUI()
    }
    
    func setupUI() {
        setMemberImage()
        Task {
            await setMemberUrlLabel()
            await setupNameLabel()
        }
    }
    
    func setupLinkText(url: String) -> NSMutableAttributedString {
        let attributedString = NSMutableAttributedString(string: "Website")
        let linkRange = NSRange(location: 0, length: attributedString.length)
        
        attributedString.addAttribute(.link, value: url, range: linkRange)
        attributedString.addAttribute(.foregroundColor, value: UIColor.blue, range: linkRange)
        
        return attributedString
    }
    
    func setMemberImage() {
        Task {
            try await detailMemberView.depictionImageView.setImage(from: URL(string: "https://www.congress.gov/img/member/\(member!.id.lowercased())_200.jpg")!)
        }
    }
    
    func setMemberUrlLabel() async {
        let detailMember = await fetchMemberById(memberId: member?.id ?? "No Id")
        let webUrl = detailMember!.results.first!.url
        detailMemberView.websiteTextView.attributedText = setupLinkText(url: webUrl)
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
        }
        return nil
    }
    
    
    // TODO: Use ApiUri from Member model, sample: "https://api.propublica.org/congress/v1/members/K000388.json"
    // This has committes to consider, need for member website which is helpful for policy agenda
    // needs to implement votes, if votes and committes then consider like horizontal section cv
}

extension DetailMembersViewController: UITextViewDelegate {
    func textView(_ textView: UITextView, shouldInteractWith URL: URL, in characterRange: NSRange, interaction: UITextItemInteraction) -> Bool {
        UIApplication.shared.open(URL)
        return false
    }
}
