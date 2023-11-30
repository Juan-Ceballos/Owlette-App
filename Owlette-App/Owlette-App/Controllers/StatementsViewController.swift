//
//  PollViewController.swift
//  Owlette-App
//
//  Created by Juan ceballos on 11/20/23.
//

import UIKit

class StatementsViewController: UIViewController {
    
    let statementsView = StatementsView()
    var statements = [ProStatement]()
    let proAPI = ProPublicaAPI()
    
    override func loadView() {
        view = statementsView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        statementsView.collectionView.delegate = self
        statementsView.collectionView.dataSource = self
        Task {
            await setupUI()
        }
    }
    
    private func fetchStatements() async -> ProStatementsContainer? {
        do {
            return try await proAPI.fetchParseData(pathComponent: "statements/latest.json", responseType: ProStatementsContainer.self)
            
        } catch {
            print("error")
        }
        return nil
    }
    
    
    private func setupUI() async {
        Task {
            statements = await fetchStatements()?.results ?? []
            DispatchQueue.main.async {
                self.statementsView.collectionView.reloadData()
            }
        }
    }

}

extension StatementsViewController: UICollectionViewDelegateFlowLayout {
    
}

extension StatementsViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        statements.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: StatementCell.reuseId, for: indexPath) as? StatementCell else {
            fatalError("error")
        }
        let currentStatement = statements[indexPath.row]
        cell.statementTextView.text = currentStatement.title
        return cell
    }
    
    
}
