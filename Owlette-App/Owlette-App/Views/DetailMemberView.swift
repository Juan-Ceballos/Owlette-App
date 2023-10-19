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
        label.font = .boldSystemFont(ofSize: 18)
        return label
    }()
    
    public var nameLabel: UILabel = {
        let label = UILabel()
        label.textColor = AppColors.textColor
        label.font = .systemFont(ofSize: 18)
        return label
    }()
    
    public var titleWebsiteLabel: UILabel = {
        let label = UILabel()
        label.textColor = AppColors.textColor
        label.text = "Website"
        label.font = .boldSystemFont(ofSize: 18)
        return label
    }()
    
    public lazy var websiteTextView: UITextView = {
        let textView = UITextView()
        textView.isEditable = false
        textView.isSelectable = true
        textView.dataDetectorTypes = .link
        let width = self.bounds.width * 0.3
        let height = self.bounds.width * 0.1
        textView.frame = CGRect(x: 0, y: 0, width: width, height: height)
        textView.backgroundColor = AppColors.primaryColor
        return textView
    }()
    
    public var districtLabel: UILabel = {
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
        pinVCBackground(of: backgroundView)
        setupDepictionImageViewConstraints()
        setupTitleNameLabelConstraints()
        setupNameLabelConstraints()
        setupTitleWebsiteLabel()
        setupWebsiteTextViewConstraints()
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
    
    private func setupTitleNameLabelConstraints() {
        addSubview(titleNameLabel)
        titleNameLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            titleNameLabel.topAnchor.constraint(equalTo: depictionImageView.bottomAnchor, constant: AppSizes.largePadding),
            titleNameLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: AppSizes.largePadding)
        ])
    }
    
    private func setupNameLabelConstraints() {
        addSubview(nameLabel)
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            nameLabel.topAnchor.constraint(equalTo: titleNameLabel.topAnchor),
            nameLabel.leadingAnchor.constraint(equalTo: depictionImageView.centerXAnchor)
        ])
    }
    
    private func setupTitleWebsiteLabel() {
        addSubview(titleWebsiteLabel)
        titleWebsiteLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            titleWebsiteLabel.topAnchor.constraint(equalTo: titleNameLabel.bottomAnchor, constant: AppSizes.medPadding),
            titleWebsiteLabel.leadingAnchor.constraint(equalTo: titleNameLabel.leadingAnchor)
        ])
    }
    
    private func setupWebsiteTextViewConstraints() {
        addSubview(websiteTextView)
        websiteTextView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            websiteTextView.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: AppSizes.smallPadding),
            websiteTextView.leadingAnchor.constraint(equalTo: nameLabel.leadingAnchor),
            websiteTextView.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.3),
            websiteTextView.heightAnchor.constraint(equalTo: widthAnchor, multiplier: 0.1)
        ])
    }
    
}
