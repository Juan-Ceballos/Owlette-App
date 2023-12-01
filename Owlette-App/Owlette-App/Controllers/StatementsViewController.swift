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
    
    func setupLinkText(url: String) -> NSMutableAttributedString {
        let attributedString = NSMutableAttributedString(string: "Full Statement")
        let linkRange = NSRange(location: 0, length: attributedString.length)
        let customFont = AppFonts.linkFont
        
        attributedString.addAttribute(.link, value: url, range: linkRange)
        attributedString.addAttribute(.foregroundColor, value: UIColor.blue, range: linkRange)
        attributedString.addAttribute(.font, value: customFont, range: linkRange)
        
        return attributedString
    }

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
        cell.fromLabel.text = "From: \(currentStatement.name)(\(currentStatement.state))"
        let linkText = setupLinkText(url: currentStatement.url)
        cell.fullStatementLinkTextView.attributedText = linkText
        return cell
    }
    
}
