//
//  AboutView.swift
//  Owlette-App
//
//  Created by Juan ceballos on 12/15/23.
//

import UIKit

class AboutView: UIView {
    
    let backgroundView: UIView = {
        let view = UIView()
        view.backgroundColor = AppColors.primaryColor
        return view
    }()
    
    public lazy var scrollView: UIScrollView = {
        let sv = UIScrollView()
        sv.backgroundColor = AppColors.primaryColor
        sv.contentInset = UIEdgeInsets.zero
        sv.contentOffset = CGPoint(x: 0.0, y: 0.0)
        sv.contentInsetAdjustmentBehavior = .never
        return sv
    }()
    
    let craiyonTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "Thanks Craiyon"
        label.font = AppFonts.headerTextFont
        label.textColor = AppColors.tertiaryColor
        return label
    }()
    
    let craiyonAttributionTextView: UITextView  = {
        let textView = UITextView()
        textView.isEditable = false
        textView.backgroundColor = AppColors.primaryColor
        textView.textColor = AppColors.textColor
        textView.font = AppFonts.labelFont
        textView.text = "This App's logo includes AI-generated art created by Craiyon. We would like to thank Craiyon for providing this creative resource. For more information about Craiyon and their AI art generation platform, please visit craiyon.com."
        return textView
    }()
    
    let proPublicaAPILabel: UILabel = {
        let label = UILabel()
        label.text = ""
        label.font = AppFonts.headerTextFont
        label.textColor = AppColors.tertiaryColor
        return label
    }()
    
    let proPublicaAPIAttributionTextView: UITextView  = {
        let textView = UITextView()
        textView.isEditable = false
        textView.backgroundColor = AppColors.primaryColor
        textView.textColor = AppColors.textColor
        textView.font = AppFonts.labelFont
        textView.text = ""
        return textView
    }()
    
    let CGAPILabel: UILabel = {
        let label = UILabel()
        label.text = ""
        label.font = AppFonts.headerTextFont
        label.textColor = AppColors.tertiaryColor
        return label
    }()
    
    let CGAPIAttributionTextView: UITextView  = {
        let textView = UITextView()
        textView.isEditable = false
        textView.backgroundColor = AppColors.primaryColor
        textView.textColor = AppColors.textColor
        textView.font = AppFonts.labelFont
        textView.text = ""
        return textView
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
        setupScrollViewConstraints()
        setupBackgroundViewConstraints()
        setupCraiyonLabelConstraints()
        setupCraiyonAttributionTextviewConstraints()
    }
    
    private func setupScrollViewConstraints() {
        addSubview(scrollView)
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            scrollView.leadingAnchor.constraint(equalTo: leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: trailingAnchor),
            scrollView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    
    private func setupBackgroundViewConstraints() {
        scrollView.addSubview(backgroundView)
        backgroundView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            backgroundView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            backgroundView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            backgroundView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            backgroundView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            backgroundView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor)
        ])
    }
    
    private func setupCraiyonLabelConstraints() {
        backgroundView.addSubview(craiyonTitleLabel)
        craiyonTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            craiyonTitleLabel.topAnchor.constraint(equalTo: backgroundView.topAnchor, constant: AppSizes.smallPadding),
            craiyonTitleLabel.centerXAnchor.constraint(equalTo: centerXAnchor)
        ])
    }
    
    private func setupCraiyonAttributionTextviewConstraints() {
        backgroundView.addSubview(craiyonAttributionTextView)
        craiyonAttributionTextView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            craiyonAttributionTextView.topAnchor.constraint(equalTo: craiyonTitleLabel.bottomAnchor, constant: AppSizes.smallPadding),
            craiyonAttributionTextView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: AppSizes.smallPadding),
            craiyonAttributionTextView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -AppSizes.smallPadding),
            craiyonAttributionTextView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.2)
        ])
    }
    
    
    
}
