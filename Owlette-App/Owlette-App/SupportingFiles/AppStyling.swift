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
}

struct AppSizes {
    static let noPadding: CGFloat = 0
    static let smallPadding: CGFloat = 8
    static let buttonHeight: CGFloat = 44
    static let largeTrailingPadding: CGFloat = -36
}

struct AppText {
    static let save = "Save"
    static let memberSectionHouse = "House"
    static let memberSectionSenate = "Senate"
    static let defaultPreferredState = "NY"
}



