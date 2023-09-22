//
//  ViewController1.swift
//  Owlette-App
//
//  Created by Juan ceballos on 8/23/23.
//

import UIKit

class MembersViewController: UIViewController {

    let memberView = MemberView()
    
    override func loadView() {
        view = memberView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

}
