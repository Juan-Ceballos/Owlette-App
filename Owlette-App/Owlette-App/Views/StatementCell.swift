//
//  StatementCell.swift
//  Owlette-App
//
//  Created by Juan ceballos on 11/28/23.
//

import UIKit

class StatementCell: UICollectionViewCell {
    
    static let statementCellReuseId = "statementCell"
    
    public lazy var cellBackgroundView: UIView = {
        let view = UIView()
        view.backgroundColor = AppColors.primaryColor
        return view
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
        //setupDetailRightChevronConstraints()
    }
    
//    private func setupDetailRightChevronConstraints() {
//        addSubview(detailRightChevron)
//        detailRightChevron.translatesAutoresizingMaskIntoConstraints = false
//        NSLayoutConstraint.activate([
//            detailRightChevron.trailingAnchor.constraint(equalTo: trailingAnchor, constant: AppSizes.largeTrailingPadding),
//            detailRightChevron.centerYAnchor.constraint(equalTo: centerYAnchor)
//        ])
//    }
    
}
