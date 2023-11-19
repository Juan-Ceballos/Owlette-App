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
        label.text = "Status"
        label.textColor = AppColors.tertiaryColor
        label.font = AppFonts.headerTextFont
        return label
    }()
    
    let latestActionTextView: UITextView = {
        let textView = UITextView()
        textView.isEditable = false
        textView.backgroundColor = AppColors.primaryColor
        textView.textColor = AppColors.textColor
        textView.font = AppFonts.labelFont
        return textView
    }()
    
    let positionLabel: UILabel = {
        let label = UILabel()
        label.textColor = AppColors.textColor
        label.font = AppFonts.labelFont
        return label
    }()
    
    let resultLabel: UILabel = {
        let label = UILabel()
        label.textColor = AppColors.textColor
        return label
    }()
    
    public lazy var totalVotesStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [yesVotesLabel, noVotesLabel, presentVotesLabel, notVotingVotesLabel])
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.distribution = .equalSpacing
        return stackView
    }()
    
    let yesVotesLabel: UILabel = {
        let label = UILabel()
        label.textColor = AppColors.textColor
        label.font = AppFonts.labelFont
        return label
    }()
    
    let noVotesLabel: UILabel = {
        let label = UILabel()
        label.textColor = AppColors.textColor
        label.font = AppFonts.labelFont
        return label
    }()
    
    let presentVotesLabel: UILabel = {
        let label = UILabel()
        label.textColor = AppColors.textColor
        label.font = AppFonts.labelFont
        return label
    }()
    
    let notVotingVotesLabel: UILabel = {
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
        pinVCBackground(of: scrollView) // background view is not scroll view, go through safelayout
        setupBackgroundViewConstraints()
        setupCloseButtonConstraints()
        setupTitleLabelConstraints()
        setupVoteTitleTextViewConstraints()
        setupVoteDescriptionTitleLabelConstraints()
        setupVoteDescriptionTextViewConstraints()
        setupStatusTitleLabelConstraints()
        setupLatestActionTextViewConstraints()
        setupPositionLabelConstraints()
        setupResultLabelConstraints()
        setupTotalVotesStackViewConstraints()
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
            titleLabel.topAnchor.constraint(equalTo: closeButton.bottomAnchor),
        ])
    }
    
    private func setupVoteTitleTextViewConstraints() {
        addSubview(voteTitleTextView)
        voteTitleTextView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            voteTitleTextView.centerXAnchor.constraint(equalTo: centerXAnchor),
            voteTitleTextView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: AppSizes.smallPadding),
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
            voteDescriptionTextView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.1)
        ])
    }
    
    private func setupStatusTitleLabelConstraints() {
        addSubview(statusTitleLabel)
        statusTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            statusTitleLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            statusTitleLabel.topAnchor.constraint(equalTo: voteDescriptionTextView.bottomAnchor, constant: AppSizes.smallPadding)
        ])
    }
    
    private func setupLatestActionTextViewConstraints() {
        addSubview(latestActionTextView)
        latestActionTextView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            latestActionTextView.centerXAnchor.constraint(equalTo: centerXAnchor),
            latestActionTextView.topAnchor.constraint(equalTo: statusTitleLabel.bottomAnchor, constant: AppSizes.smallPadding),
            latestActionTextView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: AppSizes.largePadding),
            latestActionTextView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -AppSizes.largePadding),
            latestActionTextView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.15)
        ])
    }
    
    private func setupPositionLabelConstraints() {
        addSubview(positionLabel)
        positionLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            positionLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            positionLabel.topAnchor.constraint(equalTo: latestActionTextView.bottomAnchor)
        ])
    }
    
    private func setupResultLabelConstraints() {
        addSubview(resultLabel)
        resultLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            resultLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            resultLabel.topAnchor.constraint(equalTo: positionLabel.bottomAnchor, constant: AppSizes.smallPadding)
        ])
    }
    
    private func setupTotalVotesStackViewConstraints() {
        addSubview(totalVotesStackView)
        totalVotesStackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            totalVotesStackView.topAnchor.constraint(equalTo: resultLabel.bottomAnchor, constant: AppSizes.smallPadding),
            totalVotesStackView.centerXAnchor.constraint(equalTo: centerXAnchor),
            totalVotesStackView.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.8),
            totalVotesStackView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.1)
        ])
    }
}
