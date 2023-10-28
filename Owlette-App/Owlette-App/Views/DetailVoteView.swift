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
        view.backgroundColor = AppColors.primaryColor
        return view
    }()
    
    let closeButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(systemName: "xmark"), for: .normal)
        return button
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
        setupCloseButtonConstraints()
    }
    
    private func setupCloseButtonConstraints() {
        addSubview(closeButton)
        closeButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            closeButton.topAnchor.constraint(equalTo: backgroundView.topAnchor, constant: AppSizes.medPadding),
            closeButton.trailingAnchor.constraint(equalTo: backgroundView.trailingAnchor, constant: -AppSizes.medPadding),
            closeButton.heightAnchor.constraint(equalTo: widthAnchor, multiplier: 0.2),
            closeButton.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.2)
        ])
    }
}
