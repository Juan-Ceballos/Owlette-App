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
        memberView.stateSearchTextField.delegate = self
    }
    
    var searchText: String = "CA" {
        didSet {
            print("juan here is member by state house again maybe \(membersByStateHouse)")
            // reload cv?
        }
    }
    
    func fetchMembersByState(patchComponent: String) async -> ProMembersStateModel? {
        do {
            let members = try await proPublicaAPI.fetchParseData(pathComponent: patchComponent, responseType: ProMembersStateModel.self)
            return members
        } catch {
            print("Failed to fetch and or pars MemberState model due to error: \(error)")
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
                //relosd cv?
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
        // reload cv?
    }
}

extension MembersViewController: UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = UICollectionViewCell()
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        return UICollectionReusableView()
    }
}

extension MembersViewController: UICollectionViewDelegate {
    
}
