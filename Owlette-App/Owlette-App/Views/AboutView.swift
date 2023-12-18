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
    
}
