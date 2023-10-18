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
    
    public var nameLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    public lazy var websiteTextView: UITextView = {
        let textView = UITextView()
        textView.isEditable = false
        textView.isSelectable = true
        textView.dataDetectorTypes = .link
        textView.text = "Website"
        let width = self.bounds.width * 0.3
        let height = self.bounds.width * 0.05
        textView.frame = CGRect(x: 0, y: 0, width: width, height: height)
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
        setupDetailTopContentView()
        pinContentLeading(of: depictionImageView, refSubview: detailTopContentView, topPadding: AppSizes.smallPadding, leadingPadding: AppSizes.smallPadding, width: widthAnchor, height: widthAnchor, multi: 0.2)
        setupNameLabelConstraints()
        setupWebsiteTextViewConstraints()
    }
    
    private func setupDetailTopContentView() {
        addSubview(detailTopContentView)
        detailTopContentView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            detailTopContentView.topAnchor.constraint(equalTo: backgroundView.topAnchor),
            detailTopContentView.leadingAnchor.constraint(equalTo: backgroundView.leadingAnchor),
            detailTopContentView.trailingAnchor.constraint(equalTo: backgroundView.trailingAnchor),
            detailTopContentView.heightAnchor.constraint(equalTo: backgroundView.heightAnchor, multiplier: 0.3)
        ])
    }
    
    private func setupNameLabelConstraints() {
        addSubview(nameLabel)
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            nameLabel.topAnchor.constraint(equalTo: depictionImageView.topAnchor, constant: AppSizes.medPadding),
            nameLabel.leadingAnchor.constraint(equalTo: depictionImageView.trailingAnchor, constant: AppSizes.smallPadding)
        ])
    }
    
    private func setupWebsiteTextViewConstraints() {
        addSubview(websiteTextView)
        websiteTextView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            websiteTextView.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: AppSizes.smallPadding),
            websiteTextView.leadingAnchor.constraint(equalTo: nameLabel.leadingAnchor),
            websiteTextView.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.3),
            websiteTextView.heightAnchor.constraint(equalTo: widthAnchor, multiplier: 0.05)
        ])
    }
    
}
