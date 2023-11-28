//
//  StatementsView.swift
//  Owlette-App
//
//  Created by Juan ceballos on 11/22/23.
//

import UIKit

class StatementsView: UIView {
    
    public lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        let cv = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)
        //cv.register(MemberCell.self, forCellWithReuseIdentifier: MemberCell.reuseId)
        //cv.register(MembersSectionHeaderView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: MembersSectionHeaderView.reuseId)
        //layout.itemSize = CGSize(width: self.bounds.width, height: self.bounds.height * 0.11)
        cv.backgroundColor = AppColors.primaryColor
        return cv
    }()
    
    let statementLabel: UILabel = {
        let label = UILabel()
        label.text = "Latest Congressional Statements"
        label.textColor = AppColors.tertiaryColor
        label.font = AppFonts.headerTextFont
        label.textAlignment = .center
        return label
    }()
    
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
        setupStatementLabelConstraints()
    }
    
    private func setupStatementLabelConstraints() {
        addSubview(statementLabel)
        statementLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            statementLabel.topAnchor.constraint(equalTo: backgroundView.topAnchor),
            statementLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: AppSizes.smallPadding),
            statementLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -AppSizes.smallPadding),
            statementLabel.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.1)
        ])
    }
}
