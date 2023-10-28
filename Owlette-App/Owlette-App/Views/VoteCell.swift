//
//  VoteCell.swift
//  Owlette-App
//
//  Created by Juan ceballos on 10/26/23.
//

import UIKit

class VoteCell: UICollectionViewCell {
    
    static let voteCellReuseId = "voteCell"
    
    public lazy var cellBackgroundView: UIView = {
        let view = UIView()
        view.backgroundColor = AppColors.primaryColor
        return view
    }()
    
    public lazy var billNumberLabel: UILabel = {
        let label = UILabel()
        label.textColor = AppColors.textColor
        return label
    }()
    
    public lazy var voteRecordLabel: UILabel = {
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
        pinEdges(of: cellBackgroundView)
        pinToTopLeftCorner(of: billNumberLabel, to: cellBackgroundView, topPadding: AppSizes.medPadding, leadingPadding: AppSizes.medPadding)
        pinVerticalLeading(of: voteRecordLabel, to: billNumberLabel)
        setupDetailRightChevronConstraints()
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
