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
        imageView.image = UIImage(systemName: "greaterthan")
        return imageView
    }()
    
    public lazy var memberLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        return label
    }()
    
    public lazy var nextElectionLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        return label
    }()
    
    public lazy var detailRightChevron: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "chevron.right")
        imageView.tintColor = .systemBrown
        return imageView
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
        setupNextElectionLabelConstraints()
        setupDetailRightChevronConstraints()
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
            partyUIImageView.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.17),
            partyUIImageView.heightAnchor.constraint(equalTo: widthAnchor, multiplier: 0.17)
        ])
    }
    
    private func setupMemberLabelConstraints() {
        addSubview(memberLabel)
        memberLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            memberLabel.bottomAnchor.constraint(equalTo: partyUIImageView.centerYAnchor),
            memberLabel.leadingAnchor.constraint(equalTo: partyUIImageView.trailingAnchor, constant: 16)
        ])
    }
    
    private func setupNextElectionLabelConstraints() {
        addSubview(nextElectionLabel)
        nextElectionLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            nextElectionLabel.topAnchor.constraint(equalTo: memberLabel.bottomAnchor, constant: 8),
            nextElectionLabel.leadingAnchor.constraint(equalTo: memberLabel.leadingAnchor)
        ])
    }
    
    private func setupDetailRightChevronConstraints() {
        addSubview(detailRightChevron)
        detailRightChevron.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            detailRightChevron.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -32),
            detailRightChevron.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
    }
    
}
