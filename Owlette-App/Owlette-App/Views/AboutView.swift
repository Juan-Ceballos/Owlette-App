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
        textView.text = "This App's logo includes AI-generated art created by Craiyon. We would like to thank Craiyon for providing this creative resource. For more information about Craiyon and their AI art generation platform, please visit: craiyon.com"
        return textView
    }()
    
    let proPublicaAPILabel: UILabel = {
        let label = UILabel()
        label.text = "Thanks ProPublica"
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
        textView.text = "Owlette utilizes the ProPublica Congress API to provide all of the data within the app with the exception of the images portraying congress members. We would like to express our gratitude to the ProPublica Congress API for making this valulabe service available. This API allows one to retrieve legislative data from the House of Representatives, the Senate and the Library of Congress. The API, which originated at The New York Times in 2009, includes details about members, votes, bills, nominations and other aspects of congressional activity. For more information about the ProPublica Congress API you can visit: https://projects.propublica.org/api-docs/congress-api Thank you for being a part of Owlette"
        return textView
    }()
    
    let CGAPILabel: UILabel = {
        let label = UILabel()
        label.text = "Thanks Congress.gov"
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
        textView.text = "Owlette utilizes the Congress.gov API to provide the images portraying congress members within this app. We would like to express our gratitude to the Congress.gov API for making this valulabe service available. This API provides a method for Congress and the public to view, retrieve, and re-use machine-readable data from collections available on Congress.gov. For more information about the Congress.gov API you can visit: https://gpo.congress.gov. Thank you for being a part of Owlette"
        return textView
    }()
    
    let usersAttributionLabel: UILabel = {
        let label = UILabel()
        label.text = "Thanks!"
        label.font = AppFonts.headerTextFont
        label.textColor = AppColors.tertiaryColor
        return label
    }()
    
    let usersAttributionTextView: UITextView  = {
        let textView = UITextView()
        textView.isEditable = false
        textView.backgroundColor = AppColors.primaryColor
        textView.textColor = AppColors.textColor
        textView.font = AppFonts.labelFont
        textView.text = "Thank You for using Owlette! All feedback, and comments are welcomed. I create free to use apps, if you would like to see all my released apps or upcoming projects visit: https://juan-ceballos.github.io \n If you're a fellow developer you can look at my portfolio at: \n https://github.com/Juan-Ceballos \n For professional communication visit my LinkedIn Here: \n https://www.linkedin.com/in/juan-ceballos-55b49647 \n Finally if you would like to support me, Owlette and future projects please consider donating through Venmo: @Juan-Ceballos-4 or CashApp: $angrycicada or contact me through above links. Thanks again, Juan Ceballos"
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
        setupProPublicaAPILabelConstraints()
        setupproPublicaAPIAttributionTextViewConstraints()
        setupCGAPILabelConstraints()
        setupCGAPIAttributionTextViewConstraints()
        setupUsersAttributionLabelConstraints()
        setupUsersAttributionTextViewConstraints()
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
    
    private func setupProPublicaAPILabelConstraints() {
        addSubview(proPublicaAPILabel)
        proPublicaAPILabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            proPublicaAPILabel.topAnchor.constraint(equalTo: craiyonAttributionTextView.bottomAnchor, constant: AppSizes.smallPadding),
            proPublicaAPILabel.centerXAnchor.constraint(equalTo: centerXAnchor)
        ])
    }
    
    private func setupproPublicaAPIAttributionTextViewConstraints() {
        backgroundView.addSubview(proPublicaAPIAttributionTextView)
        proPublicaAPIAttributionTextView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            proPublicaAPIAttributionTextView.topAnchor.constraint(equalTo: proPublicaAPILabel.bottomAnchor, constant: AppSizes.smallPadding),
            proPublicaAPIAttributionTextView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: AppSizes.smallPadding),
            proPublicaAPIAttributionTextView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -AppSizes.smallPadding),
            proPublicaAPIAttributionTextView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.5)
        ])
    }
    
    private func setupCGAPILabelConstraints() {
        addSubview(CGAPILabel)
        CGAPILabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            CGAPILabel.topAnchor.constraint(equalTo: proPublicaAPIAttributionTextView.bottomAnchor, constant: AppSizes.smallPadding),
            CGAPILabel.centerXAnchor.constraint(equalTo: centerXAnchor)
        ])
    }
    
    private func setupCGAPIAttributionTextViewConstraints() {
        backgroundView.addSubview(CGAPIAttributionTextView)
        CGAPIAttributionTextView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            CGAPIAttributionTextView.topAnchor.constraint(equalTo: CGAPILabel.bottomAnchor, constant: AppSizes.smallPadding),
            CGAPIAttributionTextView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: AppSizes.smallPadding),
            CGAPIAttributionTextView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -AppSizes.smallPadding),
            CGAPIAttributionTextView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.35),
        ])
    }
    
    private func setupUsersAttributionLabelConstraints() {
        backgroundView.addSubview(usersAttributionLabel)
        usersAttributionLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            usersAttributionLabel.topAnchor.constraint(equalTo: CGAPIAttributionTextView.bottomAnchor, constant: AppSizes.smallPadding),
            usersAttributionLabel.centerXAnchor.constraint(equalTo: centerXAnchor)
        ])
    }
    
    private func setupUsersAttributionTextViewConstraints() {
        backgroundView.addSubview(usersAttributionTextView)
        usersAttributionTextView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            usersAttributionTextView.topAnchor.constraint(equalTo: usersAttributionLabel.bottomAnchor, constant: AppSizes.smallPadding),
            usersAttributionTextView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: AppSizes.smallPadding),
            usersAttributionTextView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -AppSizes.smallPadding),
            usersAttributionTextView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.5),
            usersAttributionTextView.bottomAnchor.constraint(equalTo: backgroundView.bottomAnchor, constant: -AppSizes.smallPadding)
        ])
    }
    
}
