//
//  DetailMembersViewController.swift
//  Owlette-App
//
//  Created by Juan ceballos on 10/3/23.
//

import UIKit

class DetailMembersViewController: UIViewController {
    
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
        Task {
            try await detailMemberView.depictionImageView.setImage(from: URL(string: "https://www.congress.gov/img/member/\(member!.id.lowercased())_200.jpg")!)
        }
    }
}
