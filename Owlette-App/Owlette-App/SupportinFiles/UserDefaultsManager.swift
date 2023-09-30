//
//  UserDefaultsManager.swift
//  Owlette-App
//
//  Created by Juan ceballos on 9/30/23.
//

import Foundation

class UserDefaultsManager {
    static let shared = UserDefaultsManager()
    
    private let searchedStateKey = "state"
    
    private init() {}
    
    func saveSearchedState(_ searchedState: String) {
        UserDefaults.standard.set(searchedState, forKey: searchedStateKey)
    }
    
    func getSearchedState() -> String? {
        return UserDefaults.standard.string(forKey: searchedStateKey)
    }
}
