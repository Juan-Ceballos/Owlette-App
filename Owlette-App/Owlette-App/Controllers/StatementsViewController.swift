//
//  PollViewController.swift
//  Owlette-App
//
//  Created by Juan ceballos on 11/20/23.
//

import UIKit

class StatementsViewController: UIViewController {
    
    let statementsView = StatementsView()
    
    override func loadView() {
        view = statementsView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        statementsView.collectionView.delegate = self
        statementsView.collectionView.dataSource = self
    }

}

extension StatementsViewController: UICollectionViewDelegateFlowLayout {
    
}

extension StatementsViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: StatementCell.reuseId, for: indexPath) as? StatementCell else {
            fatalError("error")
        }
        
        return cell
    }
    
    
}
