//
//  AppStylig.swift
//  Owlette-App
//
//  Created by Juan ceballos on 10/8/23.
//

import UIKit

struct AppColors {
    static let primaryColor = UIColor(named: "backgroundBlack")
    static let secondaryColor = UIColor.systemBackground
    static let tertiaryColor = UIColor.systemBrown
    static let textBackgroundColor = UIColor.black
    static let textColor = UIColor.white
    static let smallComponentsColor = UIColor.systemGray
    static let lightTextColor = UIColor.lightText
}

struct AppFonts {
    static let buttonTextFont = UIFont.systemFont(ofSize: 15, weight: .heavy)
    static let headerTextFont = UIFont.boldSystemFont(ofSize: 22)
    static let boldLabelFont = UIFont.boldSystemFont(ofSize: 18)
    static let labelFont = UIFont.systemFont(ofSize: 18)
    static let linkFont = UIFont.systemFont(ofSize: 17)
}

struct AppSizes {
    static let noPadding: CGFloat = 0
    static let smallPadding: CGFloat = 8
    static let medPadding: CGFloat = 16
    static let largePadding: CGFloat = 24
    static let componentLargePadding: CGFloat = 48
    static let buttonHeight: CGFloat = 44
    static let largeTrailingPadding: CGFloat = -36
    static let sectionHeaderHeight: CGFloat = 55
}

struct AppText {
    static let saveButtonText = "Save"
    static let defaultPreferredState = "NY"
}



