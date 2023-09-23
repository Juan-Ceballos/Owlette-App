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
    var membersByState = [ProMembersState]()
    
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
        }
    }
    
    func fetchMembersByState(patchComponent: String) async -> ProMembersStateModel? {
        do {
            let members = try await proPublicaAPI.fetchParseData(pathComponent: patchComponent, responseType: ProMembersStateModel.self)
            return members
        } catch {
            print("\(error)")
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
        membersByState = currentHouseMembers?.results ?? []//currentHouseMembers?.results.first?.members ?? []
        print("juan here is member by state house \(membersByState)")
    }
}
