//
//  StatementCell.swift
//  Owlette-App
//
//  Created by Juan ceballos on 11/28/23.
//

import UIKit

class StatementCell: UICollectionViewCell {
    
    static let reuseId = "statementCell"
    override func layoutSubviews() {
        cellBackgroundView.layer.cornerRadius = 10
        cellBackgroundView.layer.masksToBounds = true
        cellBackgroundView.layer.borderWidth = 1.0
        cellBackgroundView.layer.borderColor = CGColor.init(srgbRed: 1, green: 1, blue: 1, alpha: 1)
    }
    
    public lazy var cellBackgroundView: UIView = {
        let view = UIView()
        view.backgroundColor = AppColors.tertiaryColor
        return view
    }()
    
    let statementTextView: UITextView = {
        let textView = UITextView()
        textView.backgroundColor = AppColors.tertiaryColor
        textView.font = AppFonts.labelFont
        return textView
    }()
    
    let fromLabel: UILabel = {
        let label = UILabel()
        label.font = AppFonts.labelFont
        return label
    }()
    
    let fullStatementLinkTextView: UITextView = {
        let textView = UITextView()
        textView.text = "Full Statement"
        textView.backgroundColor = AppColors.tertiaryColor
        return textView
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
        setupStatementTextViewConstraints()
        setupFromLabelConstraints()
        setupFullStatementLinkTextViewConstraints()
    }
    
    private func setupStatementTextViewConstraints() {
        addSubview(statementTextView)
        statementTextView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            statementTextView.topAnchor.constraint(equalTo: topAnchor, constant: AppSizes.smallPadding),
            statementTextView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: AppSizes.smallPadding),
            statementTextView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -AppSizes.smallPadding),
            statementTextView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.4)
        ])
    }
    
    private func setupFromLabelConstraints() {
        addSubview(fromLabel)
        fromLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            fromLabel.topAnchor.constraint(equalTo: statementTextView.bottomAnchor, constant: AppSizes.smallPadding),
            fromLabel.leadingAnchor.constraint(equalTo: statementTextView.leadingAnchor)
        ])
    }
    
    private func setupFullStatementLinkTextViewConstraints() {
        addSubview(fullStatementLinkTextView)
        fullStatementLinkTextView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            fullStatementLinkTextView.topAnchor.constraint(equalTo: fromLabel.bottomAnchor, constant: AppSizes.smallPadding),
            fullStatementLinkTextView.leadingAnchor.constraint(equalTo: statementTextView.leadingAnchor),
            fullStatementLinkTextView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.135),
            fullStatementLinkTextView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -AppSizes.smallPadding),
            fullStatementLinkTextView.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.5)
        ])
    }
    
}
