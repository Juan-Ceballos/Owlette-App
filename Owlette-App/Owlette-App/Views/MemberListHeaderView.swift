//
//  MemberListHeaderView.swift
//  Owlette-App
//
//  Created by Juan ceballos on 9/25/23.
//

import UIKit

class MembersListHeaderView: UICollectionReusableView {
    
    public lazy var titleLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: UIScreen.main.bounds)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    private func commonInit()   {
        setupTitleLabelConstraints()
    }
    
    private func setupTitleLabelConstraints() {
        addSubview(titleLabel)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
        
            titleLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            titleLabel.centerYAnchor.constraint(equalTo: centerYAnchor)
        
        ])
    }
    
}
