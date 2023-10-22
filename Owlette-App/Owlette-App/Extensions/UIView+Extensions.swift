//
//  UIView+Extensions.swift
//  Owlette-App
//
//  Created by Juan ceballos on 10/8/23.
//

import UIKit

extension UIView {
    func pinEdges(of subview: UIView) {
        addSubview(subview)
        subview.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            subview.topAnchor.constraint(equalTo: topAnchor),
            subview.leadingAnchor.constraint(equalTo: leadingAnchor),
            subview.trailingAnchor.constraint(equalTo: trailingAnchor),
            subview.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
    func pinVCBackground(of subview: UIView) {
        addSubview(subview)
        subview.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            subview.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            subview.leadingAnchor.constraint(equalTo: leadingAnchor),
            subview.trailingAnchor.constraint(equalTo: trailingAnchor),
            subview.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    
    func pinCenter(of subview: UIView, width: NSLayoutDimension? = nil, height: NSLayoutDimension? = nil, multi: CGFloat? = nil) {
        addSubview(subview)
        subview.translatesAutoresizingMaskIntoConstraints = false
        if let width = width, let height = height, let multi = multi {
            NSLayoutConstraint.activate([
                subview.centerXAnchor.constraint(equalTo: centerXAnchor),
                subview.centerYAnchor.constraint(equalTo: centerYAnchor),
                subview.widthAnchor.constraint(equalTo: width, multiplier: multi),
                subview.heightAnchor.constraint(equalTo: height, multiplier: multi)
            ])
        } else {
            NSLayoutConstraint.activate([
                subview.centerXAnchor.constraint(equalTo: centerXAnchor),
                subview.centerYAnchor.constraint(equalTo: centerYAnchor)
            ])
        }
    }
    
    func pinVerticalLeading(of subview: UIView, refSubview: UIView, topPadding: CGFloat, leadingPadding: CGFloat, width: NSLayoutDimension? = nil, height: NSLayoutDimension? = nil, multi: CGFloat? = nil) {
        addSubview(subview)
        subview.translatesAutoresizingMaskIntoConstraints = false
        
        if let width = width, let height = height, let multi = multi {
            NSLayoutConstraint.activate([
                subview.topAnchor.constraint(equalTo: refSubview.bottomAnchor, constant: topPadding),
                subview.leadingAnchor.constraint(equalTo: refSubview.leadingAnchor, constant: leadingPadding),
                subview.widthAnchor.constraint(equalTo: width, multiplier: multi),
                subview.heightAnchor.constraint(equalTo: height, multiplier: multi)
            ])
        } else {
            NSLayoutConstraint.activate([
                subview.topAnchor.constraint(equalTo: refSubview.bottomAnchor, constant: topPadding),
                subview.leadingAnchor.constraint(equalTo: refSubview.leadingAnchor, constant: leadingPadding)
            ])
        }
        
    }
    
}
