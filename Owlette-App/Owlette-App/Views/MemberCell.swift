//
//  MemberCell.swift
//  Owlette-App
//
//  Created by Juan ceballos on 9/25/23.
//

import UIKit

class MemberCell: UICollectionViewCell {
    
    static let reuseId = "memberCell"
    
    public lazy var cellContentView: UIView = {
        let view = UIView()
        return view
    }()
    
    public lazy var memberLabel: UILabel = {
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
          setupMemberLabelConstraints()
        }
    
    private func setupMemberLabelConstraints() {
        addSubview(memberLabel)
        memberLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
        
            memberLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            memberLabel.centerYAnchor.constraint(equalTo: centerYAnchor)
        
        ])
    }
    
}
