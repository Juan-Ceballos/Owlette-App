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
        view.backgroundColor = UIColor(named: "backgroundBlack")
        return view
    }()
    
    public lazy var partyUIImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "pencil")
        return imageView
    }()
    
    public lazy var memberLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        return label
    }()
    
    public lazy var roleLabel: UILabel = {
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
        setupCellContentViewConstraints()
        setupPartyImageViewConstraints()
        setupMemberLabelConstraints()
    }
    
    private func setupCellContentViewConstraints() {
        addSubview(cellContentView)
        cellContentView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            
            cellContentView.leadingAnchor.constraint(equalTo: leadingAnchor),
            cellContentView.trailingAnchor.constraint(equalTo: trailingAnchor),
            cellContentView.topAnchor.constraint(equalTo: topAnchor),
            cellContentView.bottomAnchor.constraint(equalTo: bottomAnchor)
            
        ])
    }
    
    private func setupPartyImageViewConstraints() {
        addSubview(partyUIImageView)
        partyUIImageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
        
            partyUIImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 11),
            partyUIImageView.centerYAnchor.constraint(equalTo: centerYAnchor),
            partyUIImageView.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.15),
            partyUIImageView.heightAnchor.constraint(equalTo: widthAnchor, multiplier: 0.15)
        
        ])
    }
    
    private func setupMemberLabelConstraints() {
        addSubview(memberLabel)
        memberLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            
            memberLabel.topAnchor.constraint(equalTo: cellContentView.topAnchor, constant: 8),
            memberLabel.leadingAnchor.constraint(equalTo: partyUIImageView.trailingAnchor, constant: 11)
            
        ])
    }
    
}
