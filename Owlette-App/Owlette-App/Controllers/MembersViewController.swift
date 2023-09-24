//
//  ViewController1.swift
//  Owlette-App
//
//  Created by Juan ceballos on 8/23/23.
//

import UIKit

class MembersViewController: UIViewController {
    
    let memberView = MemberView()
    let proPublicaAPI = ProPublicaAPI()
    var membersByState = [ProMemberState]()
    
    override func loadView() {
        view = memberView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        memberView.stateSearchTextField.delegate = self
    }
    
    var searchText: String = "CA" {
        didSet {
            print("juan here is member by state house again maybe \(membersByState)")
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
        // handle optional differently
        membersByState = currentHouseMembers?.results ?? []
        print("juan here is member by state house \(membersByState.count)")
        // reload cv?
    }
}
