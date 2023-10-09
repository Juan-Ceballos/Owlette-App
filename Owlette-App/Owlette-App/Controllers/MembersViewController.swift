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
    let membersKey = "Members", sectionTitleKey = "SectionTitle"
    var congressMembersDictArr: [[String: Any]] =
    [["SectionTitle": "Senate", "Members": [ProMemberState]()],
    ["SectionTitle": "House", "Members": [ProMemberState]()]]
    let congressLogoDict: [String: UIImage?] = ["D": UIImage(named: "DemLogo"), "R": UIImage(named: "RepLogo")]
    let senateIndex = 0, houseIndex = 1
    var preferredState = UserDefaultsManager.shared.getSearchedState() ?? AppText.defaultPreferredState
    
    override func loadView() {
        view = memberView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        memberView.stateSearchTextField.delegate = self
        memberView.collectionView.dataSource = self
        memberView.collectionView.delegate = self
        memberView.saveButton.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
        memberView.stateSearchTextField.text = preferredState
        Task {
            await updateSearchText(preferredState)
        }
    }
    
    @objc func buttonPressed() {
        let currentText = memberView.stateSearchTextField.text ?? ""
        if let stateInput = StatesModel.StateAbbrevDict[currentText.lowercased()], !currentText.isEmpty {
            UserDefaultsManager.shared.saveSearchedState(stateInput)
            self.showAlert(title: "Saved!", message: "Your preferred state \(currentText) has been saved")
        } else {
            self.showAlert(title: "Error \u{1f622}", message: "Do not recognize state name/abbreviation or missing field")
        }
    }
    
    func fetchMembersByState(patchComponent: String) async -> ProMembersStateModel? {
        memberView.activityIndicator.startAnimating()
        do {
            let members = try await proPublicaAPI.fetchParseData(pathComponent: patchComponent, responseType: ProMembersStateModel.self)
            return members
        } catch {
            print("Failed to fetch and or parse MemberState model due to error: \(error)")
            showAlert(title: "Error \u{1f622}", message: "Failed to load tab, please try again")
            memberView.activityIndicator.stopAnimating()
        }
        showAlert(title: "Error \u{1f622}", message: "Failed to load tab, please try again")
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
        preferredState = newText
        let currentHouseMembers = await fetchMembersByState(patchComponent: "members/house/\(preferredState)/current.json")
        let currentSenateMembers = await fetchMembersByState(patchComponent: "members/senate/\(preferredState)/current.json")
        congressMembersDictArr[senateIndex][membersKey] = currentSenateMembers?.results
        congressMembersDictArr[houseIndex][membersKey] = currentHouseMembers?.results
        DispatchQueue.main.async {
            self.memberView.collectionView.reloadData()
            self.memberView.activityIndicator.stopAnimating()
        }
    }
}

extension MembersViewController: UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return congressMembersDictArr.count
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if section == senateIndex {
            let senate = congressMembersDictArr[senateIndex][membersKey] as? [ProMemberState]
            return senate?.count ?? 0
        } else {
            let house = congressMembersDictArr[houseIndex][membersKey] as? [ProMemberState]
            return house?.count ?? 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MemberCell.reuseId, for: indexPath) as? MemberCell else {
            fatalError("error")
        }
        
        let currentCell: ProMemberState
        let senate = congressMembersDictArr[senateIndex][membersKey] as? [ProMemberState] ?? []
        let house = congressMembersDictArr[houseIndex][membersKey] as? [ProMemberState] ?? []
        
        if indexPath.section == senateIndex {
            currentCell = senate[indexPath.row]
            cell.partyUIImageView.image = congressLogoDict[currentCell.party] ?? UIImage(systemName: "questionmark")
        } else {
            currentCell = house[indexPath.row]
            cell.partyUIImageView.image = congressLogoDict[currentCell.party] ?? UIImage(systemName: "questionamark")
        }
        
        cell.memberLabel.text = currentCell.name
        cell.nextElectionLabel.text = "Next Election: \(currentCell.nextElection)"
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        if kind == UICollectionView.elementKindSectionHeader {
            let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: MembersSectionHeaderView.reuseId, for: indexPath) as! MembersSectionHeaderView
            if indexPath.section == 0 {
                let senateTitle = congressMembersDictArr[senateIndex][sectionTitleKey] as? String ?? ""
                headerView.sectionLabel.text = senateTitle
                return headerView
            }
            
            let houseTitle = congressMembersDictArr[houseIndex][sectionTitleKey] as? String ?? ""
            headerView.sectionLabel.text = houseTitle
            return headerView
        }
        
        return UICollectionReusableView()
    }
}

extension MembersViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: AppSizes.sectionHeaderHeight)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let nextVC = DetailMembersViewController()
        self.navigationController?.pushViewController(nextVC, animated: false)
    }
}
