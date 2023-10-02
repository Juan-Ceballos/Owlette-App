//
//  ViewController1.swift
//  Owlette-App
//
//  Created by Juan ceballos on 8/23/23.
//

import UIKit

// Alerts?

class MembersViewController: UIViewController {
    
    let memberView = MemberView()
    let proPublicaAPI = ProPublicaAPI()
    var membersByStateHouse = [ProMemberState]()
    var membersByStateSenate = [ProMemberState]()
    
    override func loadView() {
        view = memberView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        memberView.stateSearchTextField.delegate = self
        memberView.collectionView.dataSource = self
        memberView.collectionView.delegate = self
        memberView.saveButton.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
        let preferredState = UserDefaultsManager.shared.getSearchedState() ?? "NY"
        memberView.stateSearchTextField.text = preferredState
        // default list - TODO: Add default entered text that can be set ?? "CA"
        Task {
            await updateSearchText(preferredState)
        }
    }
    
    @objc func buttonPressed() {
        print("Button Pressed Juan")
        UserDefaultsManager.shared.saveSearchedState(searchText)
    }
    
    var searchText: String = "NY" {
        didSet {
            print("juan here is member by state house again maybe \(membersByStateHouse)")
        }
    }
    
    func fetchMembersByState(patchComponent: String) async -> ProMembersStateModel? {
        do {
            let members = try await proPublicaAPI.fetchParseData(pathComponent: patchComponent, responseType: ProMembersStateModel.self)
            return members
        } catch {
            print("Failed to fetch and or parse MemberState model due to error: \(error)")
        }
        return nil
    }
    
}

extension MembersViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if let currrentText = textField.text
        {
            let updatedText = currrentText
            
            Task {
                await updateSearchText(updatedText)
            }
        }
        return true
    }
    
    func updateSearchText(_ newText: String) async {
        searchText = newText
        let currentHouseMembers = await fetchMembersByState(patchComponent: "members/house/\(searchText)/current.json")
        let currentSenateMembers = await fetchMembersByState(patchComponent: "members/senate/\(searchText)/current.json")
        // handle optional differently
        membersByStateHouse = currentHouseMembers?.results ?? []
        membersByStateSenate = currentSenateMembers?.results ?? []
        print("juan here is member by state house \(membersByStateHouse.count)")
        print("juan here is member by state house \(membersByStateSenate.count)")
        DispatchQueue.main.async {
            self.memberView.collectionView.reloadData()
        }
    }
}

extension MembersViewController: UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if section == 0 {
            return membersByStateSenate.count
        } else {
            return membersByStateHouse.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MemberCell.reuseId, for: indexPath) as? MemberCell else {
            fatalError("error")
        }
        let currentCell: ProMemberState
        if indexPath.section == 0 {
            currentCell = membersByStateSenate[indexPath.row]
            
        } else {
            currentCell = membersByStateHouse[indexPath.row]
        }
        
        cell.memberLabel.text = currentCell.name
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        if kind == UICollectionView.elementKindSectionHeader {
            let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: MembersSectionHeaderView.reuseId, for: indexPath) as! MembersSectionHeaderView
            if indexPath.section == 0 {
                headerView.sectionLabel.text = "Senate"
            } else {
                headerView.sectionLabel.text = "House"
            }
            return headerView
        }
        return UICollectionReusableView()
    }
}

extension MembersViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: 40)
    }
}
