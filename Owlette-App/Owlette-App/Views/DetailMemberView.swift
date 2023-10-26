//
//  DetailMemberView.swift
//  Owlette-App
//
//  Created by Juan ceballos on 10/3/23.
//

import UIKit

class DetailMemberView: UIView {
    
    override func layoutSubviews() {
        depictionImageView.layer.cornerRadius = depictionImageView.frame.size.height / 2
    }
        
    public lazy var voteCV: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        let width = self.frame.size.width
        let height = self.frame.size.height * 0.1
        layout.itemSize = CGSize(width: width, height: height)
        let cv = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)
        cv.register(VoteCell.self, forCellWithReuseIdentifier: VoteCell.voteCellReuseId)
        cv.backgroundColor = AppColors.primaryColor
        return cv
    }()
    
    public var backgroundView: UIView = {
        let view = UIView()
        view.backgroundColor = AppColors.primaryColor
        return view
    }()
    
    public var detailTopContentView: UIView = {
        let view = UIView()
        view.backgroundColor = AppColors.tertiaryColor
        return view
    }()
    
    // loading?
    public lazy var depictionImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = AppColors.smallComponentsColor
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        return imageView
    }()
    
    public var titleNameLabel: UILabel = {
        let label = UILabel()
        label.textColor = AppColors.textColor
        label.text = "Name"
        label.font = AppFonts.boldLabelFont
        return label
    }()
    
    public var nameLabel: UILabel = {
        let label = UILabel()
        label.textColor = AppColors.textColor
        label.font = AppFonts.labelFont
        return label
    }()
    
    public var titleWebsiteLabel: UILabel = {
        let label = UILabel()
        label.textColor = AppColors.textColor
        label.text = "Website"
        label.font = AppFonts.boldLabelFont
        return label
    }()
    
    public lazy var websiteTextView: UITextView = {
        let textView = UITextView()
        textView.isEditable = false
        textView.isSelectable = true
        textView.dataDetectorTypes = .link
        let width = self.bounds.width * 0.3
        let height = self.bounds.width * 0.07
        textView.frame = CGRect(x: 0, y: 0, width: width, height: height)
        textView.backgroundColor = AppColors.primaryColor
        textView.contentMode = .bottom
        return textView
    }()
    
    public lazy var titlePartyLabel: UILabel = {
        let label = UILabel()
        label.text = "Party"
        label.textColor = AppColors.textColor
        label.font = AppFonts.boldLabelFont
        return label
    }()
    
    public lazy var partyTextView: UITextView = {
        let textView = UITextView()
        textView.isEditable = false
        textView.isSelectable = false
        let width = self.bounds.width * 0.05
        let height = self.bounds.width * 0.05
        textView.frame = CGRect(x: 0, y: 0, width: width, height: height)
        return textView
    }()
    
    public var titleDistrictLabel: UILabel = {
        let label = UILabel()
        label.text = "Role/District"
        label.textColor = AppColors.textColor
        label.font = AppFonts.boldLabelFont
        return label
    }()
    
    public lazy var districtLabel: UILabel = {
        let label = UILabel()
        label.textColor = AppColors.textColor
        label.font = AppFonts.labelFont
        return label
    }()
    
    public lazy var titleSeniorityLabel: UILabel = {
        let label = UILabel()
        label.text = "Seniority"
        label.textColor = AppColors.textColor
        label.font = AppFonts.boldLabelFont
        return label
    }()
    
    public lazy var seniorityLabel: UILabel = {
        let label = UILabel()
        label.textColor = AppColors.textColor
        label.font = AppFonts.labelFont
        return label
    }()
    
    // add when add flag assets
    public lazy var titleStateLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    // add when add flag assets
    public lazy var stateLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    public lazy var titleNextElectionLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    public lazy var nextElectionLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    public lazy var titleStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [titleNameLabel,
                                                       titleDistrictLabel, titleSeniorityLabel, titlePartyLabel])
        stackView.axis = .vertical
        stackView.alignment = .leading
        stackView.distribution = .equalSpacing
        return stackView
    }()
    
    public lazy var contentStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [nameLabel,
                                                       districtLabel, seniorityLabel, partyTextView])
        stackView.axis = .vertical
        stackView.alignment = .leading
        stackView.distribution = .equalSpacing
        return stackView
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
        setupDepictionImageViewConstraints()
        setupTitleStackViewConstraints()
        setupContentStackViewConstraints()
        setupPartyTextViewConstraints()
        setupWebsiteTextViewConstraints()
        setupVoteCVConstraints()
    }
    
    private func setupDepictionImageViewConstraints() {
        addSubview(depictionImageView)
        depictionImageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            depictionImageView.centerXAnchor.constraint(equalTo: centerXAnchor),
            depictionImageView.topAnchor.constraint(equalTo: backgroundView.topAnchor, constant: AppSizes.medPadding),
            depictionImageView.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.3),
            depictionImageView.heightAnchor.constraint(equalTo: widthAnchor, multiplier: 0.3)
        ])
    }
    
    private func setupTitleStackViewConstraints() {
        addSubview(titleStackView)
        titleStackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            titleStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: AppSizes.largePadding),
            titleStackView.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.4),
            titleStackView.topAnchor.constraint(equalTo: depictionImageView.bottomAnchor, constant: AppSizes.largePadding),
            titleStackView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.18)
        ])
    }
    
    private func setupContentStackViewConstraints() {
        addSubview(contentStackView)
        contentStackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            contentStackView.leadingAnchor.constraint(equalTo: centerXAnchor),
            contentStackView.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.4),
            contentStackView.topAnchor.constraint(equalTo: depictionImageView.bottomAnchor, constant: AppSizes.largePadding),
            contentStackView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.18)
        ])
    }
    
    func setupPartyTextViewConstraints() {
        contentStackView.addSubview(partyTextView) 
        partyTextView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            partyTextView.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.05),
            partyTextView.heightAnchor.constraint(equalTo: widthAnchor, multiplier: 0.05)
        ])
    }
    
    private func setupWebsiteTextViewConstraints() {
        addSubview(websiteTextView)
        websiteTextView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            websiteTextView.topAnchor.constraint(equalTo: titleStackView.bottomAnchor, constant: AppSizes.largePadding),
            websiteTextView.leadingAnchor.constraint(equalTo: titleStackView.leadingAnchor, constant: -5),
            websiteTextView.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.3),
            websiteTextView.heightAnchor.constraint(equalTo: widthAnchor, multiplier: 0.07),
        ])
    }
    
    private func setupVoteCVConstraints() {
        addSubview(voteCV)
        voteCV.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            voteCV.topAnchor.constraint(equalTo: websiteTextView.bottomAnchor, constant: AppSizes.smallPadding),
            voteCV.leadingAnchor.constraint(equalTo: leadingAnchor),
            voteCV.trailingAnchor.constraint(equalTo: trailingAnchor),
            voteCV.bottomAnchor.constraint(equalTo: backgroundView.bottomAnchor)
        ])
    }
    
}
