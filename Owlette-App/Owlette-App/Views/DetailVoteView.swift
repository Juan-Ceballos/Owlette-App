//
//  DetailVoteView.swift
//  Owlette-App
//
//  Created by Juan ceballos on 10/27/23.
//

import UIKit

class DetailVoteView: UIView {
    
    let backgroundView: UIView = {
       let view = UIView()
        view.backgroundColor = AppColors.primaryColor
        return view
    }()
    
    let closeButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(systemName: "xmark"), for: .normal)
        return button
    }()
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Bill Title"
        label.textColor = AppColors.tertiaryColor
        label.font = AppFonts.headerTextFont
        return label
    }()
    
    let voteTitleTextView: UITextView = {
        let textView = UITextView()
        textView.backgroundColor = AppColors.primaryColor
        textView.isEditable = false
        textView.textColor = AppColors.textColor
        textView.font = AppFonts.labelFont
        return textView
    }()
    
    let billNumberTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "Bill Number"
        label.textColor = AppColors.tertiaryColor
        label.font = AppFonts.headerTextFont
        return label
    }()
    
    let billNumberLabel: UILabel = {
        let label = UILabel()
        label.textColor = AppColors.textColor
        label.font = AppFonts.labelFont
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
        pinVCBackground(of: backgroundView)
        setupCloseButtonConstraints()
        setupTitleLabelConstraints()
        setupVoteTitleTextViewConstraints()
        setupBillNumberLabelTitle()
        setupBillNumberLabel()
    }
    
    private func setupCloseButtonConstraints() {
        addSubview(closeButton)
        closeButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            closeButton.topAnchor.constraint(equalTo: backgroundView.topAnchor, constant: AppSizes.medPadding),
            closeButton.trailingAnchor.constraint(equalTo: backgroundView.trailingAnchor, constant: -AppSizes.medPadding),
            closeButton.heightAnchor.constraint(equalTo: widthAnchor, multiplier: 0.2),
            closeButton.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.2)
        ])
    }
    
    private func setupTitleLabelConstraints() {
        addSubview(titleLabel)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            titleLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            titleLabel.topAnchor.constraint(equalTo: closeButton.bottomAnchor, constant: AppSizes.largePadding),
        ])
    }
    
    private func setupVoteTitleTextViewConstraints() {
        addSubview(voteTitleTextView)
        voteTitleTextView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            voteTitleTextView.centerXAnchor.constraint(equalTo: centerXAnchor),
            voteTitleTextView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: AppSizes.largePadding),
            voteTitleTextView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: AppSizes.largePadding),
            voteTitleTextView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -AppSizes.largePadding),
            voteTitleTextView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.2)
        ])
    }
    
    private func setupBillNumberLabelTitle() {
        addSubview(billNumberTitleLabel)
        billNumberTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            billNumberTitleLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            billNumberTitleLabel.topAnchor.constraint(equalTo: voteTitleTextView.bottomAnchor, constant: AppSizes.smallPadding),
        ])
    }
    
    private func setupBillNumberLabel() {
        addSubview(billNumberLabel)
        billNumberLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            billNumberLabel.topAnchor.constraint(equalTo: billNumberTitleLabel.bottomAnchor, constant: AppSizes.largePadding),
            billNumberLabel.centerXAnchor.constraint(equalTo: centerXAnchor)
        ])
    }
}
