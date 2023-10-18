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
        setupUI()
    }
    
    func setupUI() {
        setMemberImage()
        Task {
            await setMemberUrlLabel()
            await setupNameLabel()
        }
    }
    
    func setMemberImage() {
        Task {
            try await detailMemberView.depictionImageView.setImage(from: URL(string: "https://www.congress.gov/img/member/\(member!.id.lowercased())_200.jpg")!)
        }
    }
    
    func setMemberUrlLabel() async {
        let detailMember = await fetchMemberById(memberId: member?.id ?? "No Id")
        detailMemberView.websiteLabel.text = detailMember?.results.first!.url
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
