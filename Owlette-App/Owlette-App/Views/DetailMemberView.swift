//
//  DetailMemberView.swift
//  Owlette-App
//
//  Created by Juan ceballos on 10/3/23.
//

import UIKit

class DetailMemberView: UIView {
    
    public var backgroundView: UIView = {
        let view = UIView()
        view.backgroundColor = .systemBrown
        return view
    }()
    
    public lazy var depictionImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .systemGray
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
    
    private func commonInit() {
        setupBackgroundViewConstraints()
        setupDepictionImageView()
    }
    
    private func setupBackgroundViewConstraints() {
        addSubview(backgroundView)
        backgroundView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            backgroundView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            backgroundView.leadingAnchor.constraint(equalTo: leadingAnchor),
            backgroundView.trailingAnchor.constraint(equalTo: trailingAnchor),
            backgroundView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    
    private func setupDepictionImageView() {
        addSubview(depictionImageView)
        depictionImageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            depictionImageView.centerXAnchor.constraint(equalTo: centerXAnchor),
            depictionImageView.centerYAnchor.constraint(equalTo: centerYAnchor),
            depictionImageView.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.3),
            depictionImageView.heightAnchor.constraint(equalTo: widthAnchor, multiplier: 0.3)
        ])
    }
    
}
