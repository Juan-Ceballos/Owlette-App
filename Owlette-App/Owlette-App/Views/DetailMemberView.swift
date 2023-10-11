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
    
}
