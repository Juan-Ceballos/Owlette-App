//
//  MembersSectionHeaderView.swift
//  Owlette-App
//
//  Created by Juan ceballos on 10/1/23.
//

import UIKit

class MembersSectionHeaderView: UICollectionReusableView {
    
    static let reuseId = "StateSectionHeader"
    
    
    public lazy var sectionHeaderBackgroundView: UIView = {
        let view = UIView()
        view.backgroundColor = AppColors.primaryColor
        return view
    }()
    
    public lazy var sectionLabel: UILabel = {
        let label = UILabel()
        label.textColor = AppColors.tertiaryColor
        label.font = AppFonts.headerTextFont
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
        pinEdges(of: sectionHeaderBackgroundView)
        pinCenter(of: sectionLabel, to: sectionHeaderBackgroundView)
    }
    
}
