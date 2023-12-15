//
//  AboutView.swift
//  Owlette-App
//
//  Created by Juan ceballos on 12/15/23.
//

import UIKit

class AboutView: UIView {
    
    let backgroundView: UIView = {
        let view = UIView()
        view.backgroundColor = AppColors.primaryColor
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
