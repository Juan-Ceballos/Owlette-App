//
//  StatementsView.swift
//  Owlette-App
//
//  Created by Juan ceballos on 11/22/23.
//

import UIKit

class StatementsView: UIView {
    
    public lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        let cv = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)
        //cv.register(MemberCell.self, forCellWithReuseIdentifier: MemberCell.reuseId)
        //cv.register(MembersSectionHeaderView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: MembersSectionHeaderView.reuseId)
        //layout.itemSize = CGSize(width: self.bounds.width, height: self.bounds.height * 0.11)
        cv.backgroundColor = AppColors.primaryColor
        return cv
    }()
    
    let backgroundView: UIView = {
        let view = UIView()
        return view
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
    }
}
