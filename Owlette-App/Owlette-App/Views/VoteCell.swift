//
//  VoteCell.swift
//  Owlette-App
//
//  Created by Juan ceballos on 10/26/23.
//

import UIKit

class VoteCell: UICollectionViewCell {
    
    static let voteCellReuseId = "voteCell"
    
    override init(frame: CGRect) {
        super.init(frame: UIScreen.main.bounds)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    private func commonInit()   {
    }
}
