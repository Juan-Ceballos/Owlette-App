//
//  DetailVoteView.swift
//  Owlette-App
//
//  Created by Juan ceballos on 10/27/23.
//

import UIKit

class DetailVoteView: UIView {
    
    let scrollView: UIScrollView = {
        let sv = UIScrollView()
        sv.backgroundColor = AppColors.primaryColor
        // content size
        return sv
    }()
    
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
    
    let voteDescriptionTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "Description"
        label.textColor = AppColors.tertiaryColor
        label.font = AppFonts.headerTextFont
        return label
    }()
    
    let voteDescriptionTextView: UITextView = {
        let textView = UITextView()
        textView.backgroundColor = AppColors.primaryColor
        textView.isEditable = false
        textView.textColor = AppColors.textColor
        textView.font = AppFonts.labelFont
        return textView
    }()
    
    let statusTitleLabel: UILabel = {
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
        pinVCBackground(of: scrollView) // background view is not scroll view, go through safelayout
        setupBackgroundViewConstraints()
        setupCloseButtonConstraints()
        setupTitleLabelConstraints()
        setupVoteTitleTextViewConstraints()
        setupVoteDescriptionTitleLabelConstraints()
        setupVoteDescriptionTextViewConstraints()
    }
    
    private func setupBackgroundViewConstraints() {
        scrollView.addSubview(backgroundView)
        backgroundView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            backgroundView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            backgroundView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            backgroundView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor), //
            backgroundView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor) //
        ])
    }
    
    private func setupCloseButtonConstraints() {
        addSubview(closeButton)
        closeButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            closeButton.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: AppSizes.medPadding),
            closeButton.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -AppSizes.medPadding),
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
    
    private func setupVoteDescriptionTitleLabelConstraints() {
        addSubview(voteDescriptionTitleLabel)
        voteDescriptionTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            voteDescriptionTitleLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            voteDescriptionTitleLabel.topAnchor.constraint(equalTo: voteTitleTextView.bottomAnchor, constant: AppSizes.smallPadding),
        ])
    }
    
    private func setupVoteDescriptionTextViewConstraints() {
        addSubview(voteDescriptionTextView)
        voteDescriptionTextView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            voteDescriptionTextView.centerXAnchor.constraint(equalTo: centerXAnchor),
            voteDescriptionTextView.topAnchor.constraint(equalTo: voteDescriptionTitleLabel.bottomAnchor, constant: AppSizes.smallPadding),
            voteDescriptionTextView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: AppSizes.largePadding),
            voteDescriptionTextView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -AppSizes.largePadding),
            voteDescriptionTextView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.2)
        ])
    }
    
    private func setupStatusTitleLabelConstraints() {
        addSubview(<#T##view: UIView##UIView#>)
    }
}
