//
//  MembersSectionHeaderView.swift
//  Owlette-App
//
//  Created by Juan ceballos on 10/1/23.
//

import UIKit

class MembersSectionHeaderView: UICollectionReusableView {
    
    static let reuseId = "StateSectionHeader"
    
    
    public lazy var sectionHeaderBackgroundView: UIView = {
        let view = UIView()
        return view
    }()
    
    public lazy var sectionLabel: UILabel = {
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
    
    private func commonInit() {
        setupSectionHeaderBackgroundViewConstraints()
        setupSectionLabelConstraints()
    }
    
    private func setupSectionHeaderBackgroundViewConstraints() {
        addSubview(sectionHeaderBackgroundView)
        sectionHeaderBackgroundView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
        
            sectionHeaderBackgroundView.topAnchor.constraint(equalTo: topAnchor),
            sectionHeaderBackgroundView.leadingAnchor.constraint(equalTo: leadingAnchor),
            sectionHeaderBackgroundView.trailingAnchor.constraint(equalTo: trailingAnchor),
            sectionHeaderBackgroundView.bottomAnchor.constraint(equalTo: bottomAnchor)
        
        ])
    }
    
    private func setupSectionLabelConstraints() {
        addSubview(sectionLabel)
        sectionLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
        
            sectionLabel.centerXAnchor.constraint(equalTo: sectionHeaderBackgroundView.centerXAnchor),
            sectionLabel.centerYAnchor.constraint(equalTo: sectionHeaderBackgroundView.centerYAnchor)
        
        ])
    }
    
}
