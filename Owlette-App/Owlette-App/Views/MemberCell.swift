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
        view.backgroundColor = AppColors.primaryColor
        return view
    }()
    
    public lazy var partyUIImageView: UIImageView = {
        let imageView = UIImageView()
        return imageView
    }()
    
    public lazy var memberLabel: UILabel = {
        let label = UILabel()
        label.textColor = AppColors.textColor
        return label
    }()
    
    public lazy var nextElectionLabel: UILabel = {
        let label = UILabel()
        label.textColor = AppColors.textColor
        return label
    }()
    
    public lazy var detailRightChevron: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "chevron.right")
        imageView.tintColor = AppColors.tertiaryColor
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
        pinEdges(of: cellContentView)
        setupPartyImageViewConstraints()
        setupMemberLabelConstraints()
        //setupNextElectionLabelConstraints()
        pinVerticalLeading(of: nextElectionLabel, refSubview: memberLabel, topPadding: AppSizes.smallPadding, leadingPadding: AppSizes.noPadding)
        setupDetailRightChevronConstraints()
    }
    
    private func setupPartyImageViewConstraints() {
        addSubview(partyUIImageView)
        partyUIImageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            partyUIImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: AppSizes.medPadding),
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
            memberLabel.leadingAnchor.constraint(equalTo: partyUIImageView.trailingAnchor, constant: AppSizes.medPadding)
        ])
    }
    
    private func setupNextElectionLabelConstraints() {
        addSubview(nextElectionLabel)
        nextElectionLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            nextElectionLabel.topAnchor.constraint(equalTo: memberLabel.bottomAnchor, constant: AppSizes.smallPadding),
            nextElectionLabel.leadingAnchor.constraint(equalTo: memberLabel.leadingAnchor)
        ])
    }
    
    private func setupDetailRightChevronConstraints() {
        addSubview(detailRightChevron)
        detailRightChevron.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            detailRightChevron.trailingAnchor.constraint(equalTo: trailingAnchor, constant: AppSizes.largeTrailingPadding),
            detailRightChevron.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
    }
    
}
