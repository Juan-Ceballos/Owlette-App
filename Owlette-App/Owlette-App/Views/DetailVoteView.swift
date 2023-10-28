//
//  DetailVoteView.swift
//  Owlette-App
//
//  Created by Juan ceballos on 10/27/23.
//

import UIKit

class DetailVoteView: UIView {
    
    let backgroundView: UIView = {
       let view = UIView()
        view.backgroundColor = AppColors.tertiaryColor
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: UIScreen.main.bounds)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    private func commonInit() {
        pinVCBackground(of: backgroundView)
    }
}
