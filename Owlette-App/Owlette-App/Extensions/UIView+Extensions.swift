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
    
    func pinCenter(of subview: UIView, width: NSLayoutDimension, height: NSLayoutDimension, multi: CGFloat) {
        addSubview(subview)
        subview.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            subview.centerXAnchor.constraint(equalTo: centerXAnchor),
            subview.centerYAnchor.constraint(equalTo: centerYAnchor),
            subview.widthAnchor.constraint(equalTo: width, multiplier: multi),
            subview.heightAnchor.constraint(equalTo: height, multiplier: multi)
        ])
    }
    
    func pinAlignLeading(of subview: UIView, refSubviewLeading: UIView, refSubviewTrailing: UIView, topPadding: CGFloat,
                         trailingPadding: CGFloat, width: NSLayoutDimension, height: NSLayoutDimension, multi: CGFloat) {
        addSubview(subview)
        subview.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            subview.topAnchor.constraint(equalTo: refSubviewLeading.bottomAnchor, constant: topPadding),
            subview.leadingAnchor.constraint(equalTo: refSubviewLeading.leadingAnchor),
            subview.trailingAnchor.constraint(equalTo: refSubviewTrailing.trailingAnchor, constant: trailingPadding),
            subview.widthAnchor.constraint(equalTo: width, multiplier: multi),
            subview.heightAnchor.constraint(equalTo: height, multiplier: multi)
        ])
    }
}
