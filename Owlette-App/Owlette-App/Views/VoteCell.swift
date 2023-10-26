//
//  VoteCell.swift
//  Owlette-App
//
//  Created by Juan ceballos on 10/26/23.
//

import UIKit

class VoteCell: UICollectionViewCell {
    
    static let voteCellReuseId = "voteCell"
    
    public lazy var cellBackgroundView: UIView = {
        let view = UIView()
        view.backgroundColor = AppColors.primaryColor
        return view
    }()
    
    public lazy var billTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "Bill Name"
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
    
    private func commonInit()   {
        pinEdges(of: cellBackgroundView)
        pinCenter(of: billTitleLabel, to: cellBackgroundView)
    }
    
}
